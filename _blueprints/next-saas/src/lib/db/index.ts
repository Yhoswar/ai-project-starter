import { drizzle } from 'drizzle-orm/neon-http'
import { neon } from '@neondatabase/serverless'
import * as schema from './schema'

// Placeholder prevents neon() from throwing during `next build` (no DATABASE_URL in CI).
// At runtime, DATABASE_URL must be set — queries will fail otherwise.
const sql = neon(process.env.DATABASE_URL ?? 'postgresql://user:pass@localhost.invalid/placeholder')
export const db = drizzle(sql, { schema })
