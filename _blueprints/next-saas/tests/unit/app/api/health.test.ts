import { describe, it, expect } from 'vitest'
import { GET } from '@/app/api/health/route'

describe('GET /api/health', () => {
  it('returns status ok with 200', async () => {
    const response = await GET()
    expect(response.status).toBe(200)

    const data = await response.json() as { status: string; timestamp: string }
    expect(data.status).toBe('ok')
    expect(data.timestamp).toBeDefined()
    expect(new Date(data.timestamp).getTime()).not.toBeNaN()
  })
})
