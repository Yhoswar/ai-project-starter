import { Hono } from 'hono'
import { zValidator } from '@hono/zod-validator'
import { z } from 'zod'

export const usersRouter = new Hono()

usersRouter.get('/', async (c) => {
  return c.json([])
})

const createUserSchema = z.object({
  name: z.string().min(1).max(100),
  email: z.string().email(),
})

usersRouter.post('/', zValidator('json', createUserSchema), async (c) => {
  const body = c.req.valid('json')
  return c.json({ id: crypto.randomUUID(), ...body }, 201)
})
