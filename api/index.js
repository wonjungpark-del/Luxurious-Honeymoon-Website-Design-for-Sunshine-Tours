import { Hono } from 'hono'
import { handle } from 'hono/vercel'

// Import your existing Hono app
const app = new Hono().basePath('/api')

// Copy your routes from src/index.tsx here
app.get('/regions', (c) => {
  // Your existing regions API logic
  return c.json({ message: 'Regions endpoint' })
})

export default handle(app)
