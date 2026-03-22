# Next.js 15 — Reglas y Mejores Prácticas

> Destilado de bulletproof-react + convenciones App Router Next.js 15.
> Este archivo se carga automáticamente al trabajar en proyectos `next-saas`.

---

## 1. Estructura de Proyecto

Organizar por **features**, no por tipo de archivo:

```
src/
├── app/                    # App Router — solo layout, páginas, rutas
│   ├── (auth)/             # Route group sin segmento en URL
│   ├── (dashboard)/
│   ├── api/                # Route Handlers
│   ├── layout.tsx
│   └── page.tsx
├── components/             # Componentes compartidos globalmente
│   └── ui/                 # Primitivos (Button, Modal, Input...)
├── features/               # Lógica por dominio de negocio
│   └── [feature]/
│       ├── api/            # Fetchers + hooks de data fetching
│       ├── components/     # Componentes exclusivos del feature
│       ├── hooks/          # Hooks del feature
│       ├── stores/         # Estado local del feature
│       ├── types/          # Tipos TypeScript del feature
│       └── utils/          # Utilidades del feature
├── hooks/                  # Hooks globales reutilizables
├── lib/                    # Clientes preconfigurados (db, api, auth...)
├── stores/                 # Estado global de la app
├── types/                  # Tipos globales compartidos
└── utils/                  # Utilidades globales
```

**Reglas clave:**
- No importar entre features directamente — componerlas a nivel de `app/`
- No usar barrel files (`index.ts`) — importar directamente para tree-shaking
- Colocar el código lo más cerca posible de donde se usa

---

## 2. App Router — Next.js 15

### Server Components (por defecto)
- **Todo componente es Server Component por defecto** — no agregar `"use client"` innecesariamente
- Usar Server Components para: fetch de datos, acceso a DB, lógica de negocio, SEO
- Usar `"use client"` solo cuando se necesite: eventos del browser, hooks de React (`useState`, `useEffect`), acceso a `window`/`localStorage`

### Convenciones de archivos
```
app/
├── layout.tsx          # Layout persistente (no re-renderiza en navegación)
├── page.tsx            # UI de la ruta — async por defecto
├── loading.tsx         # Skeleton/spinner con Suspense automático
├── error.tsx           # Error boundary de la ruta ("use client")
├── not-found.tsx       # UI de 404
├── route.ts            # API Route Handler
└── template.tsx        # Layout que SÍ re-renderiza (casos especiales)
```

### Data Fetching
```typescript
// ✅ Server Component con async/await directo
export default async function Page() {
  const data = await fetchData() // sin useEffect, sin estado
  return <Component data={data} />
}

// ✅ Parallel fetching — no await secuencial
const [users, posts] = await Promise.all([getUsers(), getPosts()])

// ✅ Server Actions para mutaciones
async function createItem(formData: FormData) {
  "use server"
  // validar con Zod, luego DB
  revalidatePath("/items")
}
```

### Metadata
```typescript
// Estático
export const metadata: Metadata = { title: "...", description: "..." }

// Dinámico
export async function generateMetadata({ params }): Promise<Metadata> {
  const item = await getItem(params.id)
  return { title: item.name }
}
```

---

## 3. TypeScript

- Usar **strict mode** siempre (`"strict": true` en tsconfig)
- **Nunca usar `any`** — usar `unknown` + type guard si el tipo es incierto
- Inferir tipos desde Drizzle/Zod en lugar de definirlos manualmente
- Importaciones absolutas: `@/components/...` en lugar de `../../../`
- Tipos en `feature/types/` o `types/` globales — no inline en componentes grandes

```typescript
// ✅ Inferir desde el schema
import { type User } from "@/lib/db/schema"

// ✅ Zod para validación + inferencia
const schema = z.object({ email: z.string().email() })
type Input = z.infer<typeof schema>
```

---

## 4. Componentes

**Reglas:**
- Componentes pequeños y enfocados — si tiene >150 líneas, dividir
- No anidar funciones de render dentro del componente — extraer como componente separado
- Máximo ~5 props — si necesita más, usar composición o un objeto de configuración
- Envolver librerías de terceros en wrappers propios para poder cambiarlos sin afectar la app
- Nomenclatura: `PascalCase` para componentes, `camelCase` para funciones/hooks

```typescript
// ❌ Evitar
function Page() {
  function renderHeader() { return <header>...</header> }
  function renderList() { return <ul>...</ul> }
  return <div>{renderHeader()}{renderList()}</div>
}

// ✅ Correcto
function Header() { return <header>...</header> }
function ItemList() { return <ul>...</ul> }
function Page() { return <div><Header /><ItemList /></div> }
```

---

## 5. Estado

Jerarquía — usar el nivel más bajo posible:

| Tipo | Cuándo | Herramienta |
|------|--------|-------------|
| **Local** | Solo un componente | `useState` / `useReducer` |
| **Compartido entre hijos** | Elevar al padre común | Props |
| **Server cache** | Datos del servidor | TanStack Query / SWR |
| **Global UI** | Modales, notificaciones, tema | Zustand / Context |
| **Forms** | Formularios complejos | React Hook Form + Zod |

**Nunca** meter datos del servidor en estado global — para eso está TanStack Query.

---

## 6. API Layer

Cada endpoint tiene tres capas:

```typescript
// 1. Fetcher (src/features/[feature]/api/get-items.ts)
const getItems = async (): Promise<Item[]> => {
  return apiClient.get("/items")
}

// 2. Hook con caché (misma carpeta)
export const useItems = () => {
  return useQuery({ queryKey: ["items"], queryFn: getItems })
}

// 3. Mutation
export const useCreateItem = () => {
  return useMutation({
    mutationFn: (data: CreateItemInput) => apiClient.post("/items", data),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["items"] })
  })
}
```

- Un solo cliente API instanciado en `src/lib/api-client.ts`
- Tipar todas las respuestas — inferir desde Zod schemas cuando sea posible
- Interceptor global para errores: mostrar toast + logout si 401

---

## 7. Manejo de Errores

```typescript
// Error boundaries por sección, no uno global
// app/(dashboard)/error.tsx — contiene errores del dashboard
// app/(auth)/error.tsx — contiene errores de auth

// Tracking en producción
import * as Sentry from "@sentry/nextjs"
// Capturar en el interceptor del API client
```

- Error boundaries en rutas principales (no uno solo para toda la app)
- API interceptor centralizado en `lib/api-client.ts`
- Sentry para producción con source maps

---

## 8. Testing

Prioridad: **Integration > Unit > E2E**

| Tipo | Herramienta | Qué testear |
|------|-------------|-------------|
| Unit | Vitest | Funciones puras, utils, hooks complejos |
| Integration | Vitest + Testing Library | Features completas — flujo de usuario |
| E2E | Playwright | Flujos críticos de negocio (auth, checkout) |

```typescript
// ✅ Testear comportamiento, no implementación
test("muestra error cuando el email es inválido", async () => {
  render(<LoginForm />)
  await userEvent.type(screen.getByLabelText("Email"), "no-es-email")
  await userEvent.click(screen.getByRole("button", { name: "Entrar" }))
  expect(screen.getByText("Email inválido")).toBeInTheDocument()
})
```

---

## 9. Performance

- `next/image` siempre para imágenes — nunca `<img>` raw
- `next/link` siempre para navegación interna
- `next/font` para fuentes — elimina FOUT
- `dynamic()` con `{ ssr: false }` para componentes pesados solo-cliente
- `Suspense` para separar partes lentas del layout
- No poner `"use client"` en layouts o páginas si solo un hijo lo necesita

```typescript
// ✅ Aislar "use client" al componente mínimo necesario
// layout.tsx — Server Component (sin "use client")
export default function Layout({ children }) {
  return <div><StaticNav />{children}</div> // StaticNav es Server Component
}

// interactive-button.tsx — solo este es Client Component
"use client"
export function InteractiveButton() { ... }
```

---

## 10. Seguridad

- **Zod** en toda entrada: Server Actions, Route Handlers, formularios
- **Nunca SQL raw** — usar Drizzle ORM
- Variables de entorno: `NEXT_PUBLIC_` solo para lo que debe exponerse al cliente
- Middleware para proteger rutas privadas (`src/middleware.ts`)
- Auth.js v5 con sesiones httpOnly — nunca JWT en localStorage

```typescript
// middleware.ts — proteger rutas
export { auth as middleware } from "@/lib/auth"
export const config = { matcher: ["/dashboard/:path*", "/api/:path*"] }
```

---

## 11. Convenciones de Código

- **ESLint** con `eslint-config-next` + reglas de TypeScript
- **Prettier** con format-on-save
- **Husky** + lint-staged para validar antes de cada commit
- Commits en inglés, convencional: `feat:`, `fix:`, `chore:`, `docs:`
- Nombrar archivos: `kebab-case.tsx` para componentes, `camelCase.ts` para utils

---

*Fuentes: bulletproof-react (alan2207) + Next.js 15 App Router docs + convenciones Vercel*
