export class AppError extends Error {
  constructor(
    message: string,
    public readonly code: string,
    public readonly statusCode: number = 500,
  ) {
    super(message)
    this.name = 'AppError'
  }
}

export function handleError(error: unknown): { message: string; code: string; statusCode: number } {
  if (error instanceof AppError) {
    return { message: error.message, code: error.code, statusCode: error.statusCode }
  }
  if (error instanceof Error) {
    return { message: error.message, code: 'INTERNAL_ERROR', statusCode: 500 }
  }
  return { message: 'An unexpected error occurred', code: 'UNKNOWN_ERROR', statusCode: 500 }
}
