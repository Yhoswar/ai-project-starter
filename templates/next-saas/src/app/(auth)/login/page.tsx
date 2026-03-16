import { signIn } from '@/lib/auth'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'

export default function LoginPage() {
  return (
    <div className="min-h-screen flex items-center justify-center">
      <Card className="w-full max-w-sm">
        <CardHeader>
          <CardTitle>Sign in</CardTitle>
          <CardDescription>Choose your sign in method</CardDescription>
        </CardHeader>
        <CardContent className="space-y-3">
          <form action={async () => {
            'use server'
            await signIn('github', { redirectTo: '/dashboard' })
          }}>
            <Button type="submit" variant="outline" className="w-full">
              Continue with GitHub
            </Button>
          </form>
          <form action={async () => {
            'use server'
            await signIn('google', { redirectTo: '/dashboard' })
          }}>
            <Button type="submit" variant="outline" className="w-full">
              Continue with Google
            </Button>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}
