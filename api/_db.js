const { sql } = require('@vercel/postgres');

// Regions
async function getRegions(filters = {}) {
  if (filters.country && filters.is_active !== undefined) {
    const result = await sql`
      SELECT * FROM regions 
      WHERE country = ${filters.country} AND is_active = ${filters.is_active}
      ORDER BY display_order ASC, name_ko ASC
    `;
    return result.rows;
  } else if (filters.country) {
    const result = await sql`
      SELECT * FROM regions 
      WHERE country = ${filters.country}
      ORDER BY display_order ASC, name_ko ASC
    `;
    return result.rows;
  } else if (filters.is_active !== undefined) {
    const result = await sql`
      SELECT * FROM regions 
      WHERE is_active = ${filters.is_active}
      ORDER BY display_order ASC, name_ko ASC
    `;
    return result.rows;
  } else {
    const result = await sql`
      SELECT * FROM regions
      ORDER BY display_order ASC, name_ko ASC
    `;
    return result.rows;
  }
}

async function getRegionById(id) {
  const result = await sql`SELECT * FROM regions WHERE id = ${id}`;
  return result.rows[0] || null;
}

async function createRegion(data) {
  const result = await sql`
    INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
    VALUES (${data.id}, ${data.code}, ${data.country}, ${data.name_ko}, ${data.name_en}, ${data.description || ''}, ${data.image_url || ''}, ${data.display_order || 0}, ${data.is_active !== false}, NOW(), NOW())
    RETURNING *
  `;
  return result.rows[0];
}

async function updateRegion(id, data) {
  // Fetch current data first
  const current = await getRegionById(id);
  if (!current) return null;
  
  // Merge with updates
  const updated = { ...current, ...data };
  
  const result = await sql`
    UPDATE regions 
    SET 
      code = ${updated.code},
      country = ${updated.country},
      name_ko = ${updated.name_ko},
      name_en = ${updated.name_en},
      description = ${updated.description || ''},
      image_url = ${updated.image_url || ''},
      display_order = ${updated.display_order || 0},
      is_active = ${updated.is_active !== false},
      updated_at = NOW()
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
  if (filters.region_id && filters.is_active !== undefined) {
    const result = await sql`
      SELECT * FROM resorts 
      WHERE region_id = ${filters.region_id} AND is_active = ${filters.is_active}
      ORDER BY display_order ASC, name_ko ASC
    `;
    return result.rows;
  } else if (filters.region_id) {
    const result = await sql`
      SELECT * FROM resorts 
      WHERE region_id = ${filters.region_id}
      ORDER BY display_order ASC, name_ko ASC
    `;
    return result.rows;
  } else if (filters.is_active !== undefined) {
    const result = await sql`
      SELECT * FROM resorts 
      WHERE is_active = ${filters.is_active}
      ORDER BY display_order ASC, name_ko ASC
    `;
    return result.rows;
  } else {
    const result = await sql`
      SELECT * FROM resorts
      ORDER BY display_order ASC, name_ko ASC
    `;
    return result.rows;
  }
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
    VALUES (${data.id}, ${data.region_id}, ${data.name_ko}, ${data.name_en}, ${data.category || ''}, ${data.description || ''}, ${data.main_image_url || ''}, ${gallery_images_json}::jsonb, ${features_json}::jsonb, ${data.display_order || 0}, ${data.is_active !== false}, NOW(), NOW())
    RETURNING *
  `;
  return result.rows[0];
}

async function updateResort(id, data) {
  const current = await getResortById(id);
  if (!current) return null;
  
  const updated = { ...current, ...data };
  const gallery_images_json = JSON.stringify(updated.gallery_images || []);
  const features_json = JSON.stringify(updated.features || []);
  
  const result = await sql`
    UPDATE resorts 
    SET 
      region_id = ${updated.region_id},
      name_ko = ${updated.name_ko},
      name_en = ${updated.name_en},
      category = ${updated.category || ''},
      description = ${updated.description || ''},
      main_image_url = ${updated.main_image_url || ''},
      gallery_images = ${gallery_images_json}::jsonb,
      features = ${features_json}::jsonb,
      display_order = ${updated.display_order || 0},
      is_active = ${updated.is_active !== false},
      updated_at = NOW()
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
  if (filters.destination && filters.status && filters.is_featured !== undefined) {
    const result = await sql`
      SELECT * FROM reviews 
      WHERE destination = ${filters.destination} AND status = ${filters.status} AND is_featured = ${filters.is_featured}
      ORDER BY created_at DESC
    `;
    return result.rows;
  } else if (filters.destination && filters.status) {
    const result = await sql`
      SELECT * FROM reviews 
      WHERE destination = ${filters.destination} AND status = ${filters.status}
      ORDER BY created_at DESC
    `;
    return result.rows;
  } else if (filters.destination) {
    const result = await sql`
      SELECT * FROM reviews 
      WHERE destination = ${filters.destination}
      ORDER BY created_at DESC
    `;
    return result.rows;
  } else if (filters.status) {
    const result = await sql`
      SELECT * FROM reviews 
      WHERE status = ${filters.status}
      ORDER BY created_at DESC
    `;
    return result.rows;
  } else if (filters.is_featured !== undefined) {
    const result = await sql`
      SELECT * FROM reviews 
      WHERE is_featured = ${filters.is_featured}
      ORDER BY created_at DESC
    `;
    return result.rows;
  } else {
    const result = await sql`
      SELECT * FROM reviews
      ORDER BY created_at DESC
    `;
    return result.rows;
  }
}

async function getReviewById(id) {
  const result = await sql`SELECT * FROM reviews WHERE id = ${id}`;
  return result.rows[0] || null;
}

async function createReview(data) {
  const result = await sql`
    INSERT INTO reviews (id, destination, destination_kr, title, content, rating, author_name, travel_date, image_url, status, is_featured, created_at, updated_at)
    VALUES (${data.id}, ${data.destination}, ${data.destination_kr || ''}, ${data.title}, ${data.content}, ${data.rating}, ${data.author_name}, ${data.travel_date}, ${data.image_url || ''}, ${data.status || 'pending'}, ${data.is_featured !== true ? false : true}, NOW(), NOW())
    RETURNING *
  `;
  return result.rows[0];
}

async function updateReview(id, data) {
  const current = await getReviewById(id);
  if (!current) return null;
  
  const updated = { ...current, ...data };
  
  const result = await sql`
    UPDATE reviews 
    SET 
      destination = ${updated.destination},
      destination_kr = ${updated.destination_kr || ''},
      title = ${updated.title},
      content = ${updated.content},
      rating = ${updated.rating},
      author_name = ${updated.author_name},
      travel_date = ${updated.travel_date},
      image_url = ${updated.image_url || ''},
      status = ${updated.status || 'pending'},
      is_featured = ${updated.is_featured !== true ? false : true},
      updated_at = NOW()
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
  if (filters.status) {
    const result = await sql`
      SELECT * FROM inquiries 
      WHERE status = ${filters.status}
      ORDER BY created_at DESC
    `;
    return result.rows;
  } else {
    const result = await sql`
      SELECT * FROM inquiries
      ORDER BY created_at DESC
    `;
    return result.rows;
  }
}

async function getInquiryById(id) {
  const result = await sql`SELECT * FROM inquiries WHERE id = ${id}`;
  return result.rows[0] || null;
}

async function createInquiry(data) {
  const result = await sql`
    INSERT INTO inquiries (id, name, email, phone, destination, budget, travelers, departure_date, duration, subject, message, status, created_at, updated_at)
    VALUES (${data.id}, ${data.name}, ${data.email}, ${data.phone}, ${data.destination}, ${data.budget || ''}, ${data.travelers || 2}, ${data.departure_date || ''}, ${data.duration || ''}, ${data.subject}, ${data.message}, ${data.status || 'pending'}, NOW(), NOW())
    RETURNING *
  `;
  return result.rows[0];
}

async function updateInquiry(id, data) {
  const current = await getInquiryById(id);
  if (!current) return null;
  
  const updated = { ...current, ...data };
  
  const result = await sql`
    UPDATE inquiries 
    SET 
      name = ${updated.name},
      email = ${updated.email},
      phone = ${updated.phone},
      destination = ${updated.destination},
      budget = ${updated.budget || ''},
      travelers = ${updated.travelers || 2},
      departure_date = ${updated.departure_date || ''},
      duration = ${updated.duration || ''},
      subject = ${updated.subject},
      message = ${updated.message},
      status = ${updated.status || 'pending'},
      updated_at = NOW()
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
