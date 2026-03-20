import { NextResponse, type NextRequest } from 'next/server'
import { logger } from '@/lib/logger'
import { rateLimit } from '@/lib/rate-limit'

export const runtime = 'nodejs'

const limiter = rateLimit({ limit: 30, windowMs: 60_000 }) // 30 req/min per IP

export async function GET(request: NextRequest) {
  const result = limiter.check(request)
  if (!result.success) {
    return NextResponse.json({ error: 'Too Many Requests' }, { status: 429 })
  }
  logger.info('Health check')
  return NextResponse.json({ status: 'ok', timestamp: new Date().toISOString() })
}
