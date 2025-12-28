import { Hono, Context } from 'hono';
import { db } from './db';

export const resortsApp = new Hono();

// GET /api/resorts - Get all resorts with optional filters
resortsApp.get('/', async (c: Context) => {
  try {
    const region_id = c.req.query('region_id');
    const is_active = c.req.query('is_active');
    
    const filters: any = {};
    if (region_id) filters.region_id = region_id;
    if (is_active) filters.is_active = is_active === 'true';
    
    const resorts = await db.getResorts(filters);
    
    return c.json({
      success: true,
      data: resorts
    });
  } catch (error) {
    console.error('Error fetching resorts:', error);
    return c.json({
      success: false,
      error: 'Failed to fetch resorts'
    }, 500);
  }
});

// GET /api/resorts/:id - Get resort by ID
resortsApp.get('/:id', async (c: Context) => {
  try {
    const id = c.req.param('id');
    const resort = await db.getResortById(id);
    
    if (!resort) {
      return c.json({
        success: false,
        error: 'Resort not found'
      }, 404);
    }
    
    return c.json({
      success: true,
      data: resort
    });
  } catch (error) {
    console.error('Error fetching resort:', error);
    return c.json({
      success: false,
      error: 'Failed to fetch resort'
    }, 500);
  }
});

// POST /api/resorts - Create new resort
resortsApp.post('/', async (c: Context) => {
  try {
    const body = await c.req.json();
    const resort = await db.createResort(body);
    
    return c.json({
      success: true,
      data: resort
    });
  } catch (error) {
    console.error('Error creating resort:', error);
    return c.json({
      success: false,
      error: 'Failed to create resort'
    }, 500);
  }
});

// PUT /api/resorts/:id - Update resort
resortsApp.put('/:id', async (c: Context) => {
  try {
    const id = c.req.param('id');
    const body = await c.req.json();
    const resort = await db.updateResort(id, body);
    
    return c.json({
      success: true,
      data: resort
    });
  } catch (error) {
    console.error('Error updating resort:', error);
    return c.json({
      success: false,
      error: 'Failed to update resort'
    }, 500);
  }
});

// DELETE /api/resorts/:id - Delete resort
resortsApp.delete('/:id', async (c: Context) => {
  try {
    const id = c.req.param('id');
    await db.deleteResort(id);
    
    return c.json({
      success: true,
      message: 'Resort deleted successfully'
    });
  } catch (error) {
    console.error('Error deleting resort:', error);
    return c.json({
      success: false,
      error: 'Failed to delete resort'
    }, 500);
  }
});
