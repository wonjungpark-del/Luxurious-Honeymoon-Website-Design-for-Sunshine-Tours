import { getInquiries, getInquiryById, createInquiry, updateInquiry, deleteInquiry } from './_db.js';

export default async function handler(req, res) {
  try {
    const { method, query } = req;
    const id = query.id;

    // GET /api/inquiries - List all inquiries
    if (method === 'GET' && !id) {
      const filters = {};
      if (query.status) filters.status = query.status;

      const inquiries = await getInquiries(filters);
      return res.status(200).json({ success: true, data: inquiries });
    }

    // GET /api/inquiries?id=xxx - Get inquiry by ID
    if (method === 'GET' && id) {
      const inquiry = await getInquiryById(id);
      if (!inquiry) {
        return res.status(404).json({ success: false, error: 'Inquiry not found' });
      }
      return res.status(200).json({ success: true, data: inquiry });
    }

    // POST /api/inquiries - Create new inquiry
    if (method === 'POST') {
      const data = req.body;
      const inquiry = await createInquiry(data);
      return res.status(201).json({ success: true, data: inquiry });
    }

    // PATCH /api/inquiries?id=xxx - Update inquiry status
    if (method === 'PATCH' && id) {
      const data = req.body;
      const inquiry = await updateInquiry(id, data);
      return res.status(200).json({ success: true, data: inquiry });
    }

    // DELETE /api/inquiries?id=xxx - Delete inquiry
    if (method === 'DELETE' && id) {
      await deleteInquiry(id);
      return res.status(200).json({ success: true, message: 'Inquiry deleted' });
    }

    return res.status(405).json({ success: false, error: 'Method not allowed' });
  } catch (error) {
    console.error('Inquiries API error:', error);
    return res.status(500).json({ success: false, error: 'Internal server error' });
  }
}
