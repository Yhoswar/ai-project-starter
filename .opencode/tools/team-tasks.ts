import { tool } from "@opencode-ai/plugin"
import path from "path"
import fs from "fs"

interface Task {
  id: number
  title: string
  status: "PENDING" | "IN_PROGRESS" | "COMPLETED" | "BLOCKED"
  assigned_to: string
  dependencies: number[]
  created_at: string
  updated_at: string
  completed_at: string | null
  result_summary: string | null
}

interface TaskStore {
  project: string
  created: string
  updated: string
  tasks: Task[]
}

function getTasksPath(worktree: string): string {
  return path.join(worktree, ".opencode", "team", "tasks.json")
}

function readTasks(worktree: string): TaskStore {
  const tasksPath = getTasksPath(worktree)
  if (!fs.existsSync(tasksPath)) {
    return {
      project: path.basename(worktree),
      created: new Date().toISOString(),
      updated: new Date().toISOString(),
      tasks: [],
    }
  }
  const raw = fs.readFileSync(tasksPath, "utf-8")
  return JSON.parse(raw) as TaskStore
}

function writeTasks(worktree: string, store: TaskStore): void {
  const tasksPath = getTasksPath(worktree)
  const dir = path.dirname(tasksPath)
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true })
  }
  store.updated = new Date().toISOString()
  fs.writeFileSync(tasksPath, JSON.stringify(store, null, 2), "utf-8")
}

/**
 * Initialize the team task system. Creates tasks.json if it doesn't exist.
 */
export const init = tool({
  description:
    "Initialize the multi-team task tracking system. Creates .opencode/team/tasks.json if needed. Call this at the start of a team session.",
  args: {},
  async execute(_args, context) {
    const store = readTasks(context.worktree)
    writeTasks(context.worktree, store)
    return `Team task system initialized. Project: ${store.project}. Current tasks: ${store.tasks.length}.`
  },
})

/**
 * Add a new task to the team task list.
 */
export const add = tool({
  description:
    "Add a new task for a team member. Specify title, who it's assigned to (arquitecto, frontend, backend, marketer, investigador, revisor), and dependency task IDs.",
  args: {
    title: tool.schema.string().describe("Clear, actionable task description"),
    assigned_to: tool.schema
      .enum([
        "arquitecto",
        "frontend",
        "backend",
        "marketer",
        "investigador",
        "revisor",
      ])
      .describe("The subagent to assign this task to"),
    dependencies: tool.schema
      .array(tool.schema.number())
      .default([])
      .describe(
        "Array of task IDs that must be COMPLETED before this task can start"
      ),
  },
  async execute(args, context) {
    const store = readTasks(context.worktree)

    // Validate dependencies exist
    for (const depId of args.dependencies) {
      const depTask = store.tasks.find((t) => t.id === depId)
      if (!depTask) {
        return `ERROR: Dependency task #${depId} does not exist.`
      }
    }

    const now = new Date().toISOString()
    const newTask: Task = {
      id: store.tasks.length > 0 ? Math.max(...store.tasks.map((t) => t.id)) + 1 : 1,
      title: args.title,
      status: "PENDING",
      assigned_to: args.assigned_to,
      dependencies: args.dependencies,
      created_at: now,
      updated_at: now,
      completed_at: null,
      result_summary: null,
    }

    store.tasks.push(newTask)
    writeTasks(context.worktree, store)

    const depsStr =
      args.dependencies.length > 0
        ? ` (depends on: ${args.dependencies.map((d) => `#${d}`).join(", ")})`
        : " (no dependencies)"

    return `Task #${newTask.id} created: "${args.title}" -> assigned to ${args.assigned_to}${depsStr}`
  },
})

/**
 * Update the status of an existing task.
 */
export const update = tool({
  description:
    "Update the status of a team task. Use COMPLETED when a subagent finishes, BLOCKED if it can't proceed, IN_PROGRESS when starting.",
  args: {
    task_id: tool.schema.number().describe("The task ID to update"),
    status: tool.schema
      .enum(["PENDING", "IN_PROGRESS", "COMPLETED", "BLOCKED"])
      .describe("New status for the task"),
    result_summary: tool.schema
      .string()
      .optional()
      .describe(
        "Summary of what was done (for COMPLETED) or why it's blocked (for BLOCKED)"
      ),
  },
  async execute(args, context) {
    const store = readTasks(context.worktree)
    const task = store.tasks.find((t) => t.id === args.task_id)

    if (!task) {
      return `ERROR: Task #${args.task_id} not found.`
    }

    // Validate dependency rules for IN_PROGRESS
    if (args.status === "IN_PROGRESS") {
      for (const depId of task.dependencies) {
        const depTask = store.tasks.find((t) => t.id === depId)
        if (depTask && depTask.status !== "COMPLETED") {
          return `ERROR: Cannot start task #${args.task_id}. Dependency #${depId} ("${depTask.title}") is ${depTask.status}, not COMPLETED.`
        }
      }
    }

    const now = new Date().toISOString()
    task.status = args.status
    task.updated_at = now

    if (args.status === "COMPLETED") {
      task.completed_at = now
    }

    if (args.result_summary) {
      task.result_summary = args.result_summary
    }

    writeTasks(context.worktree, store)

    return `Task #${args.task_id} ("${task.title}") updated to ${args.status}.${args.result_summary ? ` Summary: ${args.result_summary}` : ""}`
  },
})

/**
 * List all tasks with their current status and dependencies.
 */
export const list = tool({
  description:
    "List all team tasks with status, assignments, and dependencies. Shows which tasks are ready to execute (all dependencies met).",
  args: {
    filter: tool.schema
      .enum(["all", "pending", "in_progress", "completed", "blocked", "ready"])
      .default("all")
      .describe(
        "Filter tasks by status. 'ready' shows PENDING tasks whose dependencies are all COMPLETED."
      ),
  },
  async execute(args, context) {
    const store = readTasks(context.worktree)

    if (store.tasks.length === 0) {
      return "No tasks found. Use team-tasks_add to create tasks."
    }

    let filtered = store.tasks

    if (args.filter === "ready") {
      filtered = store.tasks.filter((t) => {
        if (t.status !== "PENDING") return false
        return t.dependencies.every((depId) => {
          const dep = store.tasks.find((d) => d.id === depId)
          return dep && dep.status === "COMPLETED"
        })
      })
    } else if (args.filter !== "all") {
      const statusMap: Record<string, string> = {
        pending: "PENDING",
        in_progress: "IN_PROGRESS",
        completed: "COMPLETED",
        blocked: "BLOCKED",
      }
      filtered = store.tasks.filter(
        (t) => t.status === statusMap[args.filter]
      )
    }

    // Build summary
    const totalByStatus = {
      PENDING: store.tasks.filter((t) => t.status === "PENDING").length,
      IN_PROGRESS: store.tasks.filter((t) => t.status === "IN_PROGRESS").length,
      COMPLETED: store.tasks.filter((t) => t.status === "COMPLETED").length,
      BLOCKED: store.tasks.filter((t) => t.status === "BLOCKED").length,
    }

    const readyCount = store.tasks.filter((t) => {
      if (t.status !== "PENDING") return false
      return t.dependencies.every((depId) => {
        const dep = store.tasks.find((d) => d.id === depId)
        return dep && dep.status === "COMPLETED"
      })
    }).length

    let output = `## Team Tasks - ${store.project}\n`
    output += `Total: ${store.tasks.length} | Pending: ${totalByStatus.PENDING} | In Progress: ${totalByStatus.IN_PROGRESS} | Completed: ${totalByStatus.COMPLETED} | Blocked: ${totalByStatus.BLOCKED} | Ready to launch: ${readyCount}\n\n`

    if (filtered.length === 0) {
      output += `No tasks match filter "${args.filter}".`
      return output
    }

    for (const t of filtered) {
      const statusIcon =
        t.status === "COMPLETED"
          ? "[OK]"
          : t.status === "IN_PROGRESS"
            ? "[..]"
            : t.status === "BLOCKED"
              ? "[XX]"
              : "[  ]"

      const depsStr =
        t.dependencies.length > 0
          ? ` (deps: ${t.dependencies.map((d) => `#${d}`).join(", ")})`
          : ""

      output += `${statusIcon} #${t.id} ${t.title} -> ${t.assigned_to}${depsStr}\n`

      if (t.result_summary) {
        output += `     Result: ${t.result_summary}\n`
      }
    }

    return output
  },
})

/**
 * Reset all tasks (clear the task list for a new objective).
 */
export const reset = tool({
  description:
    "Clear all tasks and start fresh. Use when beginning a new team objective.",
  args: {},
  async execute(_args, context) {
    const store = readTasks(context.worktree)
    const previousCount = store.tasks.length
    store.tasks = []
    writeTasks(context.worktree, store)
    return `Task list cleared. Removed ${previousCount} tasks. Ready for new objective.`
  },
})
