import type { Context } from 'hono'

export function errorHandler(err: Error, c: Context) {
  console.error(`[Error] ${err.message}`)
  if (err.name === 'ZodError') {
    return c.json({ error: 'Validation failed', details: JSON.parse(err.message) }, 400)
  }
  return c.json(
    { error: process.env.NODE_ENV === 'production' ? 'Internal server error' : err.message },
    500
  )
}
