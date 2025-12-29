const { sql } = require('@vercel/postgres');
const { getInquiries, getInquiryById, createInquiry, updateInquiry, deleteInquiry } = require('./_db');

// Disable body parsing, we'll handle it manually
export const config = {
  api: {
    bodyParser: true,
  },
};

// Initialize inquiries table if it doesn't exist
async function initializeInquiriesTable() {
  try {
    await sql`
      CREATE TABLE IF NOT EXISTS inquiries (
        id VARCHAR(255) PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        phone VARCHAR(50),
        destination VARCHAR(255),
        budget VARCHAR(100),
        travelers INTEGER DEFAULT 2,
        departure_date VARCHAR(100),
        duration VARCHAR(100),
        subject VARCHAR(500),
        message TEXT,
        status VARCHAR(50) DEFAULT 'pending',
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `;
    await sql`CREATE INDEX IF NOT EXISTS idx_inquiries_status ON inquiries(status)`;
    await sql`CREATE INDEX IF NOT EXISTS idx_inquiries_created_at ON inquiries(created_at DESC)`;
  } catch (error) {
    console.error('Table initialization error:', error);
  }
}

// Initialize table on first load
let tableInitialized = false;

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

    // Initialize table on first request
    if (!tableInitialized) {
      await initializeInquiriesTable();
      tableInitialized = true;
    }

    const { method, query } = req;
    const id = query.id;

    console.log('Inquiries API called:', {
      method,
      id,
      hasBody: !!req.body,
      bodyType: typeof req.body,
      body: req.body
    });

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
      console.log('POST /api/inquiries received data:', JSON.stringify(data, null, 2));
      
      // Validate required fields
      if (!data.name || !data.email || !data.phone || !data.subject || !data.message) {
        console.error('Validation failed:', { name: !!data.name, email: !!data.email, phone: !!data.phone, subject: !!data.subject, message: !!data.message });
        return res.status(400).json({ 
          success: false, 
          error: 'Missing required fields',
          required: ['name', 'email', 'phone', 'subject', 'message']
        });
      }
      
      const inquiry = await createInquiry(data);
      console.log('Inquiry created successfully:', inquiry.id);
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
