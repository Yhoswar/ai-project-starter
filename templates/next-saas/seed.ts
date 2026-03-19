import { db } from './src/lib/db'
import { users } from './src/lib/db/schema'

async function seed() {
  console.log('Seeding database...')

  // Idempotent: wipe existing dev users and re-insert
  await db.delete(users)

  await db.insert(users).values([
    {
      name: 'Alice Dev',
      email: 'alice@example.com',
      emailVerified: new Date(),
    },
    {
      name: 'Bob Dev',
      email: 'bob@example.com',
      emailVerified: new Date(),
    },
  ])

  console.log('Seed complete — 2 users inserted')
  process.exit(0)
}

seed().catch((err) => {
  console.error('Seed failed:', err)
  process.exit(1)
})
