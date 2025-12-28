import { Hono, Context } from 'hono';
import { handle } from 'hono/vercel';

// Import API routes
import { regionsApp } from './routes/regions';
import { resortsApp } from './routes/resorts';
import { reviewsApp } from './routes/reviews';
import { inquiriesApp } from './routes/inquiries';
import { uploadApp } from './routes/upload';

// Create main app
const app = new Hono().basePath('/api');

// Mount routes
app.route('/regions', regionsApp);
app.route('/resorts', resortsApp);
app.route('/reviews', reviewsApp);
app.route('/inquiries', inquiriesApp);
app.route('/upload', uploadApp);

// Health check
app.get('/health', (c: Context) => {
  return c.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// Export Vercel handler
export default handle(app);
