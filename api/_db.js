const { sql } = require('@vercel/postgres');

// Regions
async function getRegions(filters = {}) {
  const conditions = [];
  
  if (filters.country) {
    conditions.push(sql`country = ${filters.country}`);
  }
  if (filters.is_active !== undefined) {
    conditions.push(sql`is_active = ${filters.is_active}`);
  }

  const whereClause = conditions.length > 0 
    ? sql` WHERE ${sql.join(conditions, sql` AND `)}`
    : sql``;

  const result = await sql`
    SELECT * FROM regions
    ${whereClause}
    ORDER BY display_order ASC, name_ko ASC
  `;
  
  return result.rows;
}

async function getRegionById(id) {
  const result = await sql`SELECT * FROM regions WHERE id = ${id}`;
  return result.rows[0] || null;
}

async function createRegion(data) {
  const result = await sql`
    INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
    VALUES (${data.id}, ${data.code}, ${data.country}, ${data.name_ko}, ${data.name_en}, ${data.description}, ${data.image_url}, ${data.display_order}, ${data.is_active}, NOW(), NOW())
    RETURNING *
  `;
  return result.rows[0];
}

async function updateRegion(id, data) {
  const updates = Object.entries(data).map(([key, value]) => sql`${sql(key)} = ${value}`);
  
  const result = await sql`
    UPDATE regions 
    SET ${sql.join(updates, sql`, `)}, updated_at = NOW()
    WHERE id = ${id}
    RETURNING *
  `;
  return result.rows[0];
}

async function deleteRegion(id) {
  await sql`DELETE FROM regions WHERE id = ${id}`;
}

// Resorts
async function getResorts(filters = {}) {
  const conditions = [];
  
  if (filters.region_id) {
    conditions.push(sql`region_id = ${filters.region_id}`);
  }
  if (filters.is_active !== undefined) {
    conditions.push(sql`is_active = ${filters.is_active}`);
  }

  const whereClause = conditions.length > 0 
    ? sql` WHERE ${sql.join(conditions, sql` AND `)}`
    : sql``;

  const result = await sql`
    SELECT * FROM resorts
    ${whereClause}
    ORDER BY display_order ASC, name_ko ASC
  `;
  
  return result.rows;
}

async function getResortById(id) {
  const result = await sql`SELECT * FROM resorts WHERE id = ${id}`;
  return result.rows[0] || null;
}

async function createResort(data) {
  const gallery_images_json = JSON.stringify(data.gallery_images || []);
  const features_json = JSON.stringify(data.features || []);
  
  const result = await sql`
    INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at)
    VALUES (${data.id}, ${data.region_id}, ${data.name_ko}, ${data.name_en}, ${data.category}, ${data.description}, ${data.main_image_url}, ${gallery_images_json}::jsonb, ${features_json}::jsonb, ${data.display_order}, ${data.is_active}, NOW(), NOW())
    RETURNING *
  `;
  return result.rows[0];
}

async function updateResort(id, data) {
  const updates = [];
  
  Object.entries(data).forEach(([key, value]) => {
    if (key === 'gallery_images' || key === 'features') {
      const jsonValue = JSON.stringify(value);
      updates.push(sql`${sql(key)} = ${jsonValue}::jsonb`);
    } else {
      updates.push(sql`${sql(key)} = ${value}`);
    }
  });
  
  const result = await sql`
    UPDATE resorts 
    SET ${sql.join(updates, sql`, `)}, updated_at = NOW()
    WHERE id = ${id}
    RETURNING *
  `;
  return result.rows[0];
}

async function deleteResort(id) {
  await sql`DELETE FROM resorts WHERE id = ${id}`;
}

// Reviews
async function getReviews(filters = {}) {
  const conditions = [];
  
  if (filters.destination) {
    conditions.push(sql`destination = ${filters.destination}`);
  }
  if (filters.status) {
    conditions.push(sql`status = ${filters.status}`);
  }
  if (filters.is_featured !== undefined) {
    conditions.push(sql`is_featured = ${filters.is_featured}`);
  }

  const whereClause = conditions.length > 0 
    ? sql` WHERE ${sql.join(conditions, sql` AND `)}`
    : sql``;

  const result = await sql`
    SELECT * FROM reviews
    ${whereClause}
    ORDER BY created_at DESC
  `;
  
  return result.rows;
}

async function getReviewById(id) {
  const result = await sql`SELECT * FROM reviews WHERE id = ${id}`;
  return result.rows[0] || null;
}

async function createReview(data) {
  const result = await sql`
    INSERT INTO reviews (id, destination, destination_kr, title, content, rating, author_name, travel_date, image_url, status, is_featured, created_at, updated_at)
    VALUES (${data.id}, ${data.destination}, ${data.destination_kr}, ${data.title}, ${data.content}, ${data.rating}, ${data.author_name}, ${data.travel_date}, ${data.image_url}, ${data.status}, ${data.is_featured}, NOW(), NOW())
    RETURNING *
  `;
  return result.rows[0];
}

async function updateReview(id, data) {
  const updates = Object.entries(data).map(([key, value]) => sql`${sql(key)} = ${value}`);
  
  const result = await sql`
    UPDATE reviews 
    SET ${sql.join(updates, sql`, `)}, updated_at = NOW()
    WHERE id = ${id}
    RETURNING *
  `;
  return result.rows[0];
}

async function deleteReview(id) {
  await sql`DELETE FROM reviews WHERE id = ${id}`;
}

// Inquiries
async function getInquiries(filters = {}) {
  const conditions = [];
  
  if (filters.status) {
    conditions.push(sql`status = ${filters.status}`);
  }

  const whereClause = conditions.length > 0 
    ? sql` WHERE ${sql.join(conditions, sql` AND `)}`
    : sql``;

  const result = await sql`
    SELECT * FROM inquiries
    ${whereClause}
    ORDER BY created_at DESC
  `;
  
  return result.rows;
}

async function getInquiryById(id) {
  const result = await sql`SELECT * FROM inquiries WHERE id = ${id}`;
  return result.rows[0] || null;
}

async function createInquiry(data) {
  const result = await sql`
    INSERT INTO inquiries (id, name, email, phone, destination, budget, travelers, departure_date, duration, subject, message, status, created_at, updated_at)
    VALUES (${data.id}, ${data.name}, ${data.email}, ${data.phone}, ${data.destination}, ${data.budget}, ${data.travelers}, ${data.departure_date}, ${data.duration}, ${data.subject}, ${data.message}, ${data.status}, NOW(), NOW())
    RETURNING *
  `;
  return result.rows[0];
}

async function updateInquiry(id, data) {
  const updates = Object.entries(data).map(([key, value]) => sql`${sql(key)} = ${value}`);
  
  const result = await sql`
    UPDATE inquiries 
    SET ${sql.join(updates, sql`, `)}, updated_at = NOW()
    WHERE id = ${id}
    RETURNING *
  `;
  return result.rows[0];
}

async function deleteInquiry(id) {
  await sql`DELETE FROM inquiries WHERE id = ${id}`;
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
