import { test, expect } from '@playwright/test'

/**
 * Smoke tests — verify the app's critical paths work end-to-end.
 * Run with: bun run test:e2e
 */

test('home page loads', async ({ page }) => {
  await page.goto('/')
  await expect(page).toHaveTitle(/.+/)
})

test('login page is accessible', async ({ page }) => {
  await page.goto('/login')
  await expect(page.locator('input[type="email"]')).toBeVisible()
})

test('health check returns 200 with ok status', async ({ page }) => {
  const response = await page.goto('/api/health')
  expect(response?.status()).toBe(200)
  const body = (await response?.json()) as { status: string }
  expect(body.status).toBe('ok')
})

test('dashboard redirects unauthenticated users to login', async ({ page }) => {
  await page.goto('/dashboard')
  await expect(page).toHaveURL(/\/login/)
})
