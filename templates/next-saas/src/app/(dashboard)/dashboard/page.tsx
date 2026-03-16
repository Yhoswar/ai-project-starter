import { auth } from '@/lib/auth'

export default async function DashboardPage() {
  const session = await auth()
  return (
    <div>
      <h1 className="text-2xl font-bold mb-4">Dashboard</h1>
      <p className="text-muted-foreground">
        Welcome back, {session?.user?.name ?? 'User'}
      </p>
    </div>
  )
}
