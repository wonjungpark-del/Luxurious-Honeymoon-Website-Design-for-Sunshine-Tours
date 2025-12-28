const { getReviews, getReviewById, createReview, updateReview, deleteReview } = require('./_db');

module.exports = async function handler(req, res) {
  try {
    const { method, query } = req;
    const id = query.id;

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
      const review = await createReview(data);
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
    return res.status(500).json({ success: false, error: 'Internal server error' });
  }
}
