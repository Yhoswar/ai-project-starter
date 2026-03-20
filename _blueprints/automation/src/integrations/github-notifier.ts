import { task } from '@trigger.dev/sdk/v3'
import { z } from 'zod'

const payloadSchema = z.object({
  repo: z.string(),
  message: z.string(),
})

export const githubNotifierTask = task({
  id: 'github-notifier',
  run: async (payload: z.infer<typeof payloadSchema>) => {
    const { repo, message } = payloadSchema.parse(payload)
    // TODO: Use Composio to create a GitHub issue
    // const composio = new ComposioToolSet({ apiKey: process.env.COMPOSIO_API_KEY })
    console.log(`Would notify ${repo}: ${message}`)
    return { notified: true, repo, message }
  },
})
