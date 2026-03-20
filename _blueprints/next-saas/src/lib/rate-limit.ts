/**
 * Simple in-memory rate limiter for API routes.
 *
 * Designed for development and low-traffic production use.
 * For high-traffic production, swap with @upstash/ratelimit (Redis-backed).
 *
 * Usage:
 *   const limiter = rateLimit({ limit: 10, windowMs: 60_000 })
 *
 *   export async function GET(request: NextRequest) {
 *     const result = limiter.check(request)
 *     if (!result.success) {
 *       return NextResponse.json({ error: 'Too Many Requests' }, { status: 429 })
 *     }
 *     // ... handler logic
 *   }
 *
 * For auth endpoints, apply via middleware.ts to catch all /api/auth/* routes.
 */

interface RateLimitOptions {
  /** Maximum number of requests allowed per window */
  limit: number
  /** Window size in milliseconds */
  windowMs: number
}

interface RateLimitEntry {
  count: number
  resetAt: number
}

export interface RateLimitResult {
  success: boolean
  remaining: number
  resetAt: number
}

export function rateLimit({ limit, windowMs }: RateLimitOptions) {
  const store = new Map<string, RateLimitEntry>()

  function cleanup() {
    const now = Date.now()
    for (const [key, entry] of store) {
      if (entry.resetAt < now) store.delete(key)
    }
  }

  return {
    check(request: Request): RateLimitResult {
      cleanup()

      const ip =
        request.headers.get('x-forwarded-for')?.split(',')[0]?.trim() ??
        request.headers.get('x-real-ip') ??
        'unknown'

      const now = Date.now()
      const entry = store.get(ip)

      if (!entry || entry.resetAt < now) {
        store.set(ip, { count: 1, resetAt: now + windowMs })
        return { success: true, remaining: limit - 1, resetAt: now + windowMs }
      }

      if (entry.count >= limit) {
        return { success: false, remaining: 0, resetAt: entry.resetAt }
      }

      entry.count++
      return { success: true, remaining: limit - entry.count, resetAt: entry.resetAt }
    },
  }
}
