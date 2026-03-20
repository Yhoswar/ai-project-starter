import { NextResponse } from 'next/server'
import { logger } from '@/lib/logger'

export const runtime = 'nodejs'

export async function GET() {
  logger.info('Health check')
  // For production rate limiting, see: @upstash/ratelimit
  return NextResponse.json({ status: 'ok', timestamp: new Date().toISOString() })
}
