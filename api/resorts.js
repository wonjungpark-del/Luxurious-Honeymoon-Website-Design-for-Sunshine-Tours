const { getResorts, getResortById, createResort, updateResort, deleteResort } = require('./_db');

module.exports = async function handler(req, res) {
  try {
    const { method, query } = req;
    const id = query.id;

    // GET /api/resorts - List all resorts
    if (method === 'GET' && !id) {
      const filters = {};
      if (query.region_id) filters.region_id = query.region_id;
      if (query.is_active !== undefined) filters.is_active = query.is_active === 'true';

      const resorts = await getResorts(filters);
      return res.status(200).json({ success: true, data: resorts });
    }

    // GET /api/resorts?id=xxx - Get resort by ID
    if (method === 'GET' && id) {
      const resort = await getResortById(id);
      if (!resort) {
        return res.status(404).json({ success: false, error: 'Resort not found' });
      }
      return res.status(200).json({ success: true, data: resort });
    }

    // POST /api/resorts - Create new resort
    if (method === 'POST') {
      const data = req.body;
      const resort = await createResort(data);
      return res.status(201).json({ success: true, data: resort });
    }

    // PUT /api/resorts?id=xxx - Update resort
    if (method === 'PUT' && id) {
      const data = req.body;
      const resort = await updateResort(id, data);
      return res.status(200).json({ success: true, data: resort });
    }

    // DELETE /api/resorts?id=xxx - Delete resort
    if (method === 'DELETE' && id) {
      await deleteResort(id);
      return res.status(200).json({ success: true, message: 'Resort deleted' });
    }

    return res.status(405).json({ success: false, error: 'Method not allowed' });
  } catch (error) {
    console.error('Resorts API error:', error);
    return res.status(500).json({ success: false, error: 'Internal server error' });
  }
}
