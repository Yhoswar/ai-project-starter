type LogLevel = 'debug' | 'info' | 'warn' | 'error'

interface LogEntry {
  level: LogLevel
  msg: string
  time: string
  [key: string]: unknown
}

function log(level: LogLevel, msg: string, data?: Record<string, unknown>) {
  const entry: LogEntry = { level, msg, time: new Date().toISOString(), ...data }

  if (process.env.NODE_ENV === 'production') {
    // JSON output — parse with pino-pretty or any log aggregator
    console[level === 'debug' ? 'log' : level](JSON.stringify(entry))
  } else {
    const prefix = { debug: '[DEBUG]', info: '[INFO] ', warn: '[WARN] ', error: '[ERROR]' }[level]
    const extras = data && Object.keys(data).length ? ` ${JSON.stringify(data)}` : ''
    console[level === 'debug' ? 'log' : level](`${prefix} ${msg}${extras}`)
  }
}

export const logger = {
  debug: (msg: string, data?: Record<string, unknown>) => log('debug', msg, data),
  info:  (msg: string, data?: Record<string, unknown>) => log('info',  msg, data),
  warn:  (msg: string, data?: Record<string, unknown>) => log('warn',  msg, data),
  error: (msg: string, data?: Record<string, unknown>) => log('error', msg, data),
}
