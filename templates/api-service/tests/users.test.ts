import { describe, it, expect } from 'vitest'
import app from '../src/index'

describe('GET /health', () => {
  it('returns 200 with status ok', async () => {
    const res = await app.fetch(new Request('http://localhost/health'))
    const body = await res.json() as { status: string }
    expect(res.status).toBe(200)
    expect(body.status).toBe('ok')
  })
})

describe('GET /api/users', () => {
  it('returns 200 with array', async () => {
    const res = await app.fetch(new Request('http://localhost/api/users'))
    expect(res.status).toBe(200)
    const body = await res.json() as unknown[]
    expect(Array.isArray(body)).toBe(true)
  })
})
