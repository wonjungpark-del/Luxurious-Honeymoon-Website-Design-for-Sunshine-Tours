import { Hono } from 'hono';
import { db } from '../db';

export const inquiriesApp = new Hono();

// GET /api/inquiries - Get all inquiries with optional filters
inquiriesApp.get('/', async (c) => {
  try {
    const status = c.req.query('status');
    
    const filters: any = {};
    if (status) filters.status = status;
    
    const inquiries = await db.getInquiries(filters);
    
    return c.json({
      success: true,
      data: inquiries
    });
  } catch (error) {
    console.error('Error fetching inquiries:', error);
    return c.json({
      success: false,
      error: 'Failed to fetch inquiries'
    }, 500);
  }
});

// GET /api/inquiries/:id - Get inquiry by ID
inquiriesApp.get('/:id', async (c) => {
  try {
    const id = c.req.param('id');
    const inquiry = await db.getInquiryById(id);
    
    if (!inquiry) {
      return c.json({
        success: false,
        error: 'Inquiry not found'
      }, 404);
    }
    
    return c.json({
      success: true,
      data: inquiry
    });
  } catch (error) {
    console.error('Error fetching inquiry:', error);
    return c.json({
      success: false,
      error: 'Failed to fetch inquiry'
    }, 500);
  }
});

// POST /api/inquiries - Create new inquiry
inquiriesApp.post('/', async (c) => {
  try {
    const body = await c.req.json();
    const inquiry = await db.createInquiry(body);
    
    return c.json({
      success: true,
      data: inquiry
    });
  } catch (error) {
    console.error('Error creating inquiry:', error);
    return c.json({
      success: false,
      error: 'Failed to create inquiry'
    }, 500);
  }
});

// PATCH /api/inquiries/:id - Update inquiry status
inquiriesApp.patch('/:id', async (c) => {
  try {
    const id = c.req.param('id');
    const body = await c.req.json();
    const inquiry = await db.updateInquiry(id, body);
    
    return c.json({
      success: true,
      data: inquiry
    });
  } catch (error) {
    console.error('Error updating inquiry:', error);
    return c.json({
      success: false,
      error: 'Failed to update inquiry'
    }, 500);
  }
});

// DELETE /api/inquiries/:id - Delete inquiry
inquiriesApp.delete('/:id', async (c) => {
  try {
    const id = c.req.param('id');
    await db.deleteInquiry(id);
    
    return c.json({
      success: true,
      message: 'Inquiry deleted successfully'
    });
  } catch (error) {
    console.error('Error deleting inquiry:', error);
    return c.json({
      success: false,
      error: 'Failed to delete inquiry'
    }, 500);
  }
});
