import { Hono } from 'hono'
import { cors } from 'hono/cors'
import { logger } from 'hono/logger'
import { secureHeaders } from 'hono/secure-headers'
import { errorHandler } from './middleware/error-handler'
import { usersRouter } from './routes/users'

const app = new Hono()

app.use('*', logger())
app.use('*', secureHeaders())
app.use('/api/*', cors({
  origin: process.env.ALLOWED_ORIGIN ?? 'http://localhost:3000',
  credentials: true,
}))

app.route('/api/users', usersRouter)
app.get('/health', (c) => c.json({ status: 'ok', timestamp: new Date().toISOString() }))
app.onError(errorHandler)

export default {
  port: parseInt(process.env.PORT ?? '3001'),
  fetch: app.fetch,
}
