import { schedules } from '@trigger.dev/sdk/v3'

export interface DigestItem {
  title: string
  url: string
}

export function buildDigestContent(items: DigestItem[]): string {
  if (items.length === 0) return 'No updates for this period.'
  return items
    .map((item, i) => `${i + 1}. ${item.title}\n   ${item.url}`)
    .join('\n\n')
}

export const weeklyDigestJob = schedules.task({
  id: 'weekly-email-digest',
  cron: '0 9 * * 1',
  run: async (_payload) => {
    const items: DigestItem[] = []
    const content = buildDigestContent(items)
    console.log('Digest content:', content)
    return { success: true, itemCount: items.length }
  },
})
