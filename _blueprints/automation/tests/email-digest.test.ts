import { describe, it, expect } from 'vitest'
import { buildDigestContent } from '../src/jobs/email-digest'

describe('buildDigestContent', () => {
  it('formats items into digest string', () => {
    const items = [
      { title: 'Update 1', url: 'https://example.com/1' },
      { title: 'Update 2', url: 'https://example.com/2' },
    ]
    const result = buildDigestContent(items)
    expect(result).toContain('Update 1')
    expect(result).toContain('Update 2')
    expect(result).toContain('https://example.com/1')
  })

  it('returns empty message when no items', () => {
    const result = buildDigestContent([])
    expect(result).toContain('No updates')
  })
})
