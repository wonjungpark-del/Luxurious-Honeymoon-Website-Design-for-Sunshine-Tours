import { Hono, Context } from 'hono';
import { db } from '../db';

export const reviewsApp = new Hono();

// GET /api/reviews - Get all reviews with optional filters
reviewsApp.get('/', async (c: Context) => {
  try {
    const destination = c.req.query('destination');
    const status = c.req.query('status');
    const is_featured = c.req.query('is_featured');
    
    const filters: any = {};
    if (destination) filters.destination = destination;
    if (status) filters.status = status;
    if (is_featured) filters.is_featured = is_featured === 'true';
    
    const reviews = await db.getReviews(filters);
    
    return c.json({
      success: true,
      data: reviews
    });
  } catch (error) {
    console.error('Error fetching reviews:', error);
    return c.json({
      success: false,
      error: 'Failed to fetch reviews'
    }, 500);
  }
});

// GET /api/reviews/:id - Get review by ID
reviewsApp.get('/:id', async (c: Context) => {
  try {
    const id = c.req.param('id');
    const review = await db.getReviewById(id);
    
    if (!review) {
      return c.json({
        success: false,
        error: 'Review not found'
      }, 404);
    }
    
    return c.json({
      success: true,
      data: review
    });
  } catch (error) {
    console.error('Error fetching review:', error);
    return c.json({
      success: false,
      error: 'Failed to fetch review'
    }, 500);
  }
});

// POST /api/reviews - Create new review
reviewsApp.post('/', async (c: Context) => {
  try {
    const body = await c.req.json();
    const review = await db.createReview(body);
    
    return c.json({
      success: true,
      data: review
    });
  } catch (error) {
    console.error('Error creating review:', error);
    return c.json({
      success: false,
      error: 'Failed to create review'
    }, 500);
  }
});

// PATCH /api/reviews/:id - Update review status
reviewsApp.patch('/:id', async (c: Context) => {
  try {
    const id = c.req.param('id');
    const body = await c.req.json();
    const review = await db.updateReview(id, body);
    
    return c.json({
      success: true,
      data: review
    });
  } catch (error) {
    console.error('Error updating review:', error);
    return c.json({
      success: false,
      error: 'Failed to update review'
    }, 500);
  }
});

// DELETE /api/reviews/:id - Delete review
reviewsApp.delete('/:id', async (c: Context) => {
  try {
    const id = c.req.param('id');
    await db.deleteReview(id);
    
    return c.json({
      success: true,
      message: 'Review deleted successfully'
    });
  } catch (error) {
    console.error('Error deleting review:', error);
    return c.json({
      success: false,
      error: 'Failed to delete review'
    }, 500);
  }
});
