const { getReviews, getReviewById, createReview, updateReview, deleteReview } = require('./_db');

module.exports = async function handler(req, res) {
  try {
    // Set CORS headers
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PATCH, DELETE, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    
    // Handle OPTIONS request
    if (req.method === 'OPTIONS') {
      return res.status(200).end();
    }

    const { method, query } = req;
    const id = query.id;

    console.log('Reviews API called:', {
      method,
      id,
      hasBody: !!req.body,
      bodyType: typeof req.body,
      body: req.body
    });

    // GET /api/reviews - List all reviews
    if (method === 'GET' && !id) {
      const filters = {};
      if (query.destination) filters.destination = query.destination;
      if (query.status) filters.status = query.status;
      if (query.is_featured !== undefined) filters.is_featured = query.is_featured === 'true';

      const reviews = await getReviews(filters);
      return res.status(200).json({ success: true, data: reviews });
    }

    // GET /api/reviews?id=xxx - Get review by ID
    if (method === 'GET' && id) {
      const review = await getReviewById(id);
      if (!review) {
        return res.status(404).json({ success: false, error: 'Review not found' });
      }
      return res.status(200).json({ success: true, data: review });
    }

    // POST /api/reviews - Create new review
    if (method === 'POST') {
      const data = req.body;
      console.log('POST /api/reviews received data:', JSON.stringify(data, null, 2));
      
      // Validate required fields
      if (!data.destination || !data.title || !data.content || !data.rating || !data.author_name) {
        console.error('Validation failed:', { 
          destination: !!data.destination, 
          title: !!data.title, 
          content: !!data.content, 
          rating: !!data.rating, 
          author_name: !!data.author_name 
        });
        return res.status(400).json({ 
          success: false, 
          error: 'Missing required fields',
          required: ['destination', 'title', 'content', 'rating', 'author_name']
        });
      }
      
      const review = await createReview(data);
      console.log('Review created successfully:', review.id);
      return res.status(201).json({ success: true, data: review });
    }

    // PATCH /api/reviews?id=xxx - Update review (status, is_featured)
    if (method === 'PATCH' && id) {
      const data = req.body;
      const review = await updateReview(id, data);
      return res.status(200).json({ success: true, data: review });
    }

    // DELETE /api/reviews?id=xxx - Delete review
    if (method === 'DELETE' && id) {
      await deleteReview(id);
      return res.status(200).json({ success: true, message: 'Review deleted' });
    }

    return res.status(405).json({ success: false, error: 'Method not allowed' });
  } catch (error) {
    console.error('Reviews API error:', error);
    console.error('Error details:', {
      message: error.message,
      stack: error.stack,
      method: req.method,
      body: req.body
    });
    return res.status(500).json({ 
      success: false, 
      error: 'Internal server error',
      details: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
}
