This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

First, run the development server:

```bash
npm i
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

### Summary Table

| Layer        | Stack/Library/Tool                                                                                                                             |
|--------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| Language     | TypeScript                                                                                                                                     |
| Frontend     | React, Next.js, Tailwind, shadcn/ui, Radix UI, Kendo React OrgChart, Lucide React, React Hook Form, React Day Picker, React Hot Toast, Next Themes, React Icons |
| Backend/API  | Next.js API, Prisma, Zod                                                                                                                       |
| Auth         | NextAuth.js, Clerk, @auth/prisma-adapter                                                                                                       |
| Database     | PostgreSQL (via Prisma ORM)                                                                                                                    |
| Utilities    | Date-fns, Dayjs, Class Variance Authority, clsx, Cmdk, Vaul                                                                                    |
| Dev Tools    | TypeScript, ESLint, PostCSS, Tailwind CSS, Prisma                                                                                              |

---

## Authentication & Security

- **Authentication** is handled with [NextAuth.js](https://next-auth.js.org/) and [Clerk](https://clerk.dev/), providing secure sign-in, session management, and multi-provider support.
- **Role propagation** is implemented via JWT/session callbacks, making user roles available both server- and client-side.
- **Domain whitelisting:** Only users from allowed domains can sign in (see `lib/auth.ts`).
- **RBAC (Role-Based Access Control):** All sensitive actions and API routes are guarded by role checks, ensuring only authorized users can act.
- **Session security:** Sessions are validated on each request and roles are checked before all privileged actions.
- **Environment variables:** Used for secrets and configuration to keep sensitive data secure.
- **Middleware:** Next.js middlewares and custom wrappers enforce authentication and authorization across protected routes, ensuring a unified security layer.

---

## Role-Based Access Control (RBAC)

This project uses a flexible, database-driven RBAC system to manage user permissions and features. Key elements:

- **User Roles:** Users have roles (`USER`, `ADMIN`, `MODERATOR`, `MANAGER`, etc.) stored in the database, updatable by ADMINs in the dashboard.
- **API Route Protection:** API routes strictly check user roles before allowing sensitive actions (e.g., only ADMIN or MODERATOR can create/edit balances; only ADMIN can change user roles).
- **Session & JWT Propagation:** User roles are included in authentication tokens and sessions for universal access checks.
- **Role-Based UI:** Navigation and features are tailored to user roles, so only authorized actions/routes are visible.
- **Evolving Role Model:** Roles and permissions are actively maintained and updated via database migrations.
- **Special Roles:** MODERATOR and MANAGER roles have dedicated responsibilities for leave approvals, team management, etc.

**Example:**  
To restrict a route to ADMIN and MODERATOR users:
```typescript
const allowedRoles = ["ADMIN", "MODERATOR"];
if (!allowedRoles.includes(loggedInUser?.role as Role)) {
  throw new Error("You are not permitted to perform this action");
}
```

See the Prisma schema (`prisma/schema.prisma`), API route code (`app/api/**/route.ts`), and session logic for details.

---

## Use of Middleware

- **Authorization middleware:** Custom logic and Next.js Middleware are used to check roles and permissions before protected API routes or pages are accessed.
- **Session middleware:** Ensures user sessions are authenticated and valid across all protected areas.
- **Request validation:** Middleware and Zod schemas validate incoming API requests for type safety and security.

---

## API Documentation

- **RESTful API routes** are implemented using Next.js API handlers (`/app/api/...`). These routes handle CRUD for users, balances, leaves, and more.
- **Request/response:** All API communication uses JSON.
- **Validation:** All input is validated by Zod schemas before processing.
- **Authentication:** Most endpoints require authentication and role checks; unauthorized requests are returned with error status codes.
- **Example endpoints:**
  - `POST /api/balance` — Create a balance (ADMIN, MODERATOR only)
  - `PATCH /api/user/[userId]` — Update user details/role (ADMIN only)
  - `PATCH /api/balance/[balanceId]` — Edit a balance (ADMIN, MODERATOR only)
- See the `app/api` directory for implementation details and inline docs.

---

## Project Highlights

- **Modern, accessible UI** built with shadcn/ui, Radix, Kendo React OrgChart, and Tailwind.
- **Strong type safety** and validation with TypeScript, Prisma, and Zod.
- **Flexible role management** and strict security practices.
- **Ready for extension** with modular, well-structured code (e.g., easily add new roles, features, or API endpoints).

---

Feel free to explore the codebase or reach out with questions! 🚀

