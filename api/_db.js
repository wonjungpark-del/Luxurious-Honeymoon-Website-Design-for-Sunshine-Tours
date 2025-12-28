const { sql } = require('@vercel/postgres');

// Regions
async function getRegions(filters = {}) {
  let queryText = 'SELECT * FROM regions WHERE 1=1';
  const params = [];
  let paramIndex = 1;

  if (filters.country) {
    queryText += ` AND country = $${paramIndex++}`;
    params.push(filters.country);
  }
  if (filters.is_active !== undefined) {
    queryText += ` AND is_active = $${paramIndex++}`;
    params.push(filters.is_active);
  }

  queryText += ' ORDER BY display_order ASC, name_ko ASC';
  const result = await sql.query(queryText, params);
  return result.rows;
}

async function getRegionById(id) {
  const result = await sql.query('SELECT * FROM regions WHERE id = $1', [id]);
  return result.rows[0] || null;
}

async function createRegion(data) {
  const result = await sql.query(
    `INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, NOW(), NOW())
     RETURNING *`,
    [data.id, data.code, data.country, data.name_ko, data.name_en, data.description, data.image_url, data.display_order, data.is_active]
  );
  return result.rows[0];
}

async function updateRegion(id, data) {
  const fields = [];
  const params = [];
  let paramIndex = 1;

  Object.entries(data).forEach(([key, value]) => {
    fields.push(`${key} = $${paramIndex++}`);
    params.push(value);
  });

  fields.push(`updated_at = NOW()`);
  params.push(id);

  const result = await sql.query(
    `UPDATE regions SET ${fields.join(', ')} WHERE id = $${paramIndex} RETURNING *`,
    params
  );
  return result.rows[0];
}

async function deleteRegion(id) {
  await sql.query('DELETE FROM regions WHERE id = $1', [id]);
}

// Resorts
async function getResorts(filters = {}) {
  let queryText = 'SELECT * FROM resorts WHERE 1=1';
  const params = [];
  let paramIndex = 1;

  if (filters.region_id) {
    queryText += ` AND region_id = $${paramIndex++}`;
    params.push(filters.region_id);
  }
  if (filters.is_active !== undefined) {
    queryText += ` AND is_active = $${paramIndex++}`;
    params.push(filters.is_active);
  }

  queryText += ' ORDER BY display_order ASC, name_ko ASC';
  const result = await sql.query(queryText, params);
  return result.rows;
}

async function getResortById(id) {
  const result = await sql.query('SELECT * FROM resorts WHERE id = $1', [id]);
  return result.rows[0] || null;
}

async function createResort(data) {
  const result = await sql.query(
    `INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, NOW(), NOW())
     RETURNING *`,
    [
      data.id,
      data.region_id,
      data.name_ko,
      data.name_en,
      data.category,
      data.description,
      data.main_image_url,
      JSON.stringify(data.gallery_images || []),
      JSON.stringify(data.features || []),
      data.display_order,
      data.is_active
    ]
  );
  return result.rows[0];
}

async function updateResort(id, data) {
  const fields = [];
  const params = [];
  let paramIndex = 1;

  Object.entries(data).forEach(([key, value]) => {
    if (key === 'gallery_images' || key === 'features') {
      fields.push(`${key} = $${paramIndex++}`);
      params.push(JSON.stringify(value));
    } else {
      fields.push(`${key} = $${paramIndex++}`);
      params.push(value);
    }
  });

  fields.push(`updated_at = NOW()`);
  params.push(id);

  const result = await sql.query(
    `UPDATE resorts SET ${fields.join(', ')} WHERE id = $${paramIndex} RETURNING *`,
    params
  );
  return result.rows[0];
}

async function deleteResort(id) {
  await sql.query('DELETE FROM resorts WHERE id = $1', [id]);
}

// Reviews
async function getReviews(filters = {}) {
  let queryText = 'SELECT * FROM reviews WHERE 1=1';
  const params = [];
  let paramIndex = 1;

  if (filters.destination) {
    queryText += ` AND destination = $${paramIndex++}`;
    params.push(filters.destination);
  }
  if (filters.status) {
    queryText += ` AND status = $${paramIndex++}`;
    params.push(filters.status);
  }
  if (filters.is_featured !== undefined) {
    queryText += ` AND is_featured = $${paramIndex++}`;
    params.push(filters.is_featured);
  }

  queryText += ' ORDER BY created_at DESC';
  const result = await sql.query(queryText, params);
  return result.rows;
}

async function getReviewById(id) {
  const result = await sql.query('SELECT * FROM reviews WHERE id = $1', [id]);
  return result.rows[0] || null;
}

async function createReview(data) {
  const result = await sql.query(
    `INSERT INTO reviews (id, destination, destination_kr, title, content, rating, author_name, travel_date, image_url, status, is_featured, created_at, updated_at)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, NOW(), NOW())
     RETURNING *`,
    [
      data.id,
      data.destination,
      data.destination_kr,
      data.title,
      data.content,
      data.rating,
      data.author_name,
      data.travel_date,
      data.image_url,
      data.status,
      data.is_featured
    ]
  );
  return result.rows[0];
}

async function updateReview(id, data) {
  const fields = [];
  const params = [];
  let paramIndex = 1;

  Object.entries(data).forEach(([key, value]) => {
    fields.push(`${key} = $${paramIndex++}`);
    params.push(value);
  });

  fields.push(`updated_at = NOW()`);
  params.push(id);

  const result = await sql.query(
    `UPDATE reviews SET ${fields.join(', ')} WHERE id = $${paramIndex} RETURNING *`,
    params
  );
  return result.rows[0];
}

async function deleteReview(id) {
  await sql.query('DELETE FROM reviews WHERE id = $1', [id]);
}

// Inquiries
async function getInquiries(filters = {}) {
  let queryText = 'SELECT * FROM inquiries WHERE 1=1';
  const params = [];
  let paramIndex = 1;

  if (filters.status) {
    queryText += ` AND status = $${paramIndex++}`;
    params.push(filters.status);
  }

  queryText += ' ORDER BY created_at DESC';
  const result = await sql.query(queryText, params);
  return result.rows;
}

async function getInquiryById(id) {
  const result = await sql.query('SELECT * FROM inquiries WHERE id = $1', [id]);
  return result.rows[0] || null;
}

async function createInquiry(data) {
  const result = await sql.query(
    `INSERT INTO inquiries (id, name, email, phone, destination, budget, travelers, departure_date, duration, subject, message, status, created_at, updated_at)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, NOW(), NOW())
     RETURNING *`,
    [
      data.id,
      data.name,
      data.email,
      data.phone,
      data.destination,
      data.budget,
      data.travelers,
      data.departure_date,
      data.duration,
      data.subject,
      data.message,
      data.status
    ]
  );
  return result.rows[0];
}

async function updateInquiry(id, data) {
  const fields = [];
  const params = [];
  let paramIndex = 1;

  Object.entries(data).forEach(([key, value]) => {
    fields.push(`${key} = $${paramIndex++}`);
    params.push(value);
  });

  fields.push(`updated_at = NOW()`);
  params.push(id);

  const result = await sql.query(
    `UPDATE inquiries SET ${fields.join(', ')} WHERE id = $${paramIndex} RETURNING *`,
    params
  );
  return result.rows[0];
}

async function deleteInquiry(id) {
  await sql.query('DELETE FROM inquiries WHERE id = $1', [id]);
}

module.exports = {
  getRegions,
  getRegionById,
  createRegion,
  updateRegion,
  deleteRegion,
  getResorts,
  getResortById,
  createResort,
  updateResort,
  deleteResort,
  getReviews,
  getReviewById,
  createReview,
  updateReview,
  deleteReview,
  getInquiries,
  getInquiryById,
  createInquiry,
  updateInquiry,
  deleteInquiry,
};
