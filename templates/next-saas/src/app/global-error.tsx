'use client'

export default function GlobalError({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  return (
    <html>
      <body>
        <div style={{ display: 'flex', minHeight: '100vh', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', gap: '1rem', fontFamily: 'sans-serif' }}>
          <h1 style={{ fontSize: '1.5rem', fontWeight: 'bold' }}>Something went wrong</h1>
          <p style={{ color: '#666' }}>{error.message ?? 'An unexpected error occurred'}</p>
          {error.digest && <p style={{ fontSize: '0.75rem', color: '#999' }}>Error ID: {error.digest}</p>}
          <button
            onClick={reset}
            style={{ padding: '0.5rem 1rem', background: '#000', color: '#fff', border: 'none', borderRadius: '0.375rem', cursor: 'pointer' }}
          >
            Try again
          </button>
        </div>
      </body>
    </html>
  )
}
