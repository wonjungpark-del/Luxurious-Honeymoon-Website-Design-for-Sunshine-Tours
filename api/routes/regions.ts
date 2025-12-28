import { Hono } from 'hono';
import { db } from '../db';

export const regionsApp = new Hono();

// GET /api/regions - Get all regions with optional filters
regionsApp.get('/', async (c) => {
  try {
    const country = c.req.query('country');
    const is_active = c.req.query('is_active');
    
    const filters: any = {};
    if (country) filters.country = country;
    if (is_active) filters.is_active = is_active === 'true';
    
    const regions = await db.getRegions(filters);
    
    return c.json({
      success: true,
      data: regions
    });
  } catch (error) {
    console.error('Error fetching regions:', error);
    return c.json({
      success: false,
      error: 'Failed to fetch regions'
    }, 500);
  }
});

// GET /api/regions/:id - Get region by ID
regionsApp.get('/:id', async (c) => {
  try {
    const id = c.req.param('id');
    const region = await db.getRegionById(id);
    
    if (!region) {
      return c.json({
        success: false,
        error: 'Region not found'
      }, 404);
    }
    
    return c.json({
      success: true,
      data: region
    });
  } catch (error) {
    console.error('Error fetching region:', error);
    return c.json({
      success: false,
      error: 'Failed to fetch region'
    }, 500);
  }
});

// POST /api/regions - Create new region
regionsApp.post('/', async (c) => {
  try {
    const body = await c.req.json();
    const region = await db.createRegion(body);
    
    return c.json({
      success: true,
      data: region
    });
  } catch (error) {
    console.error('Error creating region:', error);
    return c.json({
      success: false,
      error: 'Failed to create region'
    }, 500);
  }
});

// PUT /api/regions/:id - Update region
regionsApp.put('/:id', async (c) => {
  try {
    const id = c.req.param('id');
    const body = await c.req.json();
    const region = await db.updateRegion(id, body);
    
    return c.json({
      success: true,
      data: region
    });
  } catch (error) {
    console.error('Error updating region:', error);
    return c.json({
      success: false,
      error: 'Failed to update region'
    }, 500);
  }
});

// DELETE /api/regions/:id - Delete region
regionsApp.delete('/:id', async (c) => {
  try {
    const id = c.req.param('id');
    await db.deleteRegion(id);
    
    return c.json({
      success: true,
      message: 'Region deleted successfully'
    });
  } catch (error) {
    console.error('Error deleting region:', error);
    return c.json({
      success: false,
      error: 'Failed to delete region'
    }, 500);
  }
});
