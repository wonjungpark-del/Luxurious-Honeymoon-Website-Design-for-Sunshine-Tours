// Database helper for Vercel Postgres (Neon)
import { sql } from '@vercel/postgres';

export interface Region {
  id: string;
  code: string;
  country: string;
  name_ko: string;
  name_en: string;
  description?: string;
  image_url?: string;
  display_order: number;
  is_active: boolean;
  created_at: string;
  updated_at: string;
}

export interface Resort {
  id: string;
  region_id: string;
  name_ko: string;
  name_en: string;
  category: string;
  description?: string;
  main_image_url?: string;
  gallery_images?: string[];
  features?: string[];
  display_order: number;
  is_active: boolean;
  created_at: string;
  updated_at: string;
}

export interface Review {
  id: string;
  destination: string;
  destination_kr: string;
  title: string;
  content: string;
  rating: number;
  author_name: string;
  travel_date: string;
  image_url?: string;
  status: 'pending' | 'approved' | 'rejected';
  is_featured: boolean;
  created_at: string;
  updated_at: string;
}

export interface Inquiry {
  id: string;
  name: string;
  email: string;
  phone: string;
  destination: string;
  budget?: string;
  travelers: number;
  departure_date?: string;
  duration?: string;
  subject: string;
  message: string;
  status: 'pending' | 'processing' | 'completed';
  created_at: string;
  updated_at: string;
}

// Helper function to execute queries
export async function query<T>(queryText: string, params: any[] = []): Promise<T[]> {
  try {
    const result = await sql.query(queryText, params);
    return result.rows as T[];
  } catch (error) {
    console.error('Database query error:', error);
    throw error;
  }
}

// Regions
export async function getRegions(filters?: { country?: string; is_active?: boolean }): Promise<Region[]> {
  let queryText = 'SELECT * FROM regions WHERE 1=1';
  const params: any[] = [];
  let paramIndex = 1;

  if (filters?.country) {
    queryText += ` AND country = $${paramIndex++}`;
    params.push(filters.country);
  }
  if (filters?.is_active !== undefined) {
    queryText += ` AND is_active = $${paramIndex++}`;
    params.push(filters.is_active);
  }

  queryText += ' ORDER BY display_order ASC, name_ko ASC';
  return query<Region>(queryText, params);
}

export async function getRegionById(id: string): Promise<Region | null> {
  const results = await query<Region>('SELECT * FROM regions WHERE id = $1', [id]);
  return results[0] || null;
}

export async function createRegion(data: Omit<Region, 'created_at' | 'updated_at'>): Promise<Region> {
  const results = await query<Region>(
    `INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
     VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, NOW(), NOW())
     RETURNING *`,
    [data.id, data.code, data.country, data.name_ko, data.name_en, data.description, data.image_url, data.display_order, data.is_active]
  );
  return results[0];
}

export async function updateRegion(id: string, data: Partial<Omit<Region, 'id' | 'created_at' | 'updated_at'>>): Promise<Region> {
  const fields: string[] = [];
  const params: any[] = [];
  let paramIndex = 1;

  Object.entries(data).forEach(([key, value]) => {
    fields.push(`${key} = $${paramIndex++}`);
    params.push(value);
  });

  fields.push(`updated_at = NOW()`);
  params.push(id);

  const results = await query<Region>(
    `UPDATE regions SET ${fields.join(', ')} WHERE id = $${paramIndex} RETURNING *`,
    params
  );
  return results[0];
}

export async function deleteRegion(id: string): Promise<void> {
  await query('DELETE FROM regions WHERE id = $1', [id]);
}

// Resorts
export async function getResorts(filters?: { region_id?: string; is_active?: boolean }): Promise<Resort[]> {
  let queryText = 'SELECT * FROM resorts WHERE 1=1';
  const params: any[] = [];
  let paramIndex = 1;

  if (filters?.region_id) {
    queryText += ` AND region_id = $${paramIndex++}`;
    params.push(filters.region_id);
  }
  if (filters?.is_active !== undefined) {
    queryText += ` AND is_active = $${paramIndex++}`;
    params.push(filters.is_active);
  }

  queryText += ' ORDER BY display_order ASC, name_ko ASC';
  return query<Resort>(queryText, params);
}

export async function getResortById(id: string): Promise<Resort | null> {
  const results = await query<Resort>('SELECT * FROM resorts WHERE id = $1', [id]);
  return results[0] || null;
}

export async function createResort(data: Omit<Resort, 'created_at' | 'updated_at'>): Promise<Resort> {
  const results = await query<Resort>(
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
  return results[0];
}

export async function updateResort(id: string, data: Partial<Omit<Resort, 'id' | 'created_at' | 'updated_at'>>): Promise<Resort> {
  const fields: string[] = [];
  const params: any[] = [];
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

  const results = await query<Resort>(
    `UPDATE resorts SET ${fields.join(', ')} WHERE id = $${paramIndex} RETURNING *`,
    params
  );
  return results[0];
}

export async function deleteResort(id: string): Promise<void> {
  await query('DELETE FROM resorts WHERE id = $1', [id]);
}

// Reviews
export async function getReviews(filters?: { destination?: string; status?: string; is_featured?: boolean }): Promise<Review[]> {
  let queryText = 'SELECT * FROM reviews WHERE 1=1';
  const params: any[] = [];
  let paramIndex = 1;

  if (filters?.destination) {
    queryText += ` AND destination = $${paramIndex++}`;
    params.push(filters.destination);
  }
  if (filters?.status) {
    queryText += ` AND status = $${paramIndex++}`;
    params.push(filters.status);
  }
  if (filters?.is_featured !== undefined) {
    queryText += ` AND is_featured = $${paramIndex++}`;
    params.push(filters.is_featured);
  }

  queryText += ' ORDER BY created_at DESC';
  return query<Review>(queryText, params);
}

export async function getReviewById(id: string): Promise<Review | null> {
  const results = await query<Review>('SELECT * FROM reviews WHERE id = $1', [id]);
  return results[0] || null;
}

export async function createReview(data: Omit<Review, 'created_at' | 'updated_at'>): Promise<Review> {
  const results = await query<Review>(
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
  return results[0];
}

export async function updateReview(id: string, data: Partial<Omit<Review, 'id' | 'created_at' | 'updated_at'>>): Promise<Review> {
  const fields: string[] = [];
  const params: any[] = [];
  let paramIndex = 1;

  Object.entries(data).forEach(([key, value]) => {
    fields.push(`${key} = $${paramIndex++}`);
    params.push(value);
  });

  fields.push(`updated_at = NOW()`);
  params.push(id);

  const results = await query<Review>(
    `UPDATE reviews SET ${fields.join(', ')} WHERE id = $${paramIndex} RETURNING *`,
    params
  );
  return results[0];
}

export async function deleteReview(id: string): Promise<void> {
  await query('DELETE FROM reviews WHERE id = $1', [id]);
}

// Inquiries
export async function getInquiries(filters?: { status?: string }): Promise<Inquiry[]> {
  let queryText = 'SELECT * FROM inquiries WHERE 1=1';
  const params: any[] = [];
  let paramIndex = 1;

  if (filters?.status) {
    queryText += ` AND status = $${paramIndex++}`;
    params.push(filters.status);
  }

  queryText += ' ORDER BY created_at DESC';
  return query<Inquiry>(queryText, params);
}

export async function getInquiryById(id: string): Promise<Inquiry | null> {
  const results = await query<Inquiry>('SELECT * FROM inquiries WHERE id = $1', [id]);
  return results[0] || null;
}

export async function createInquiry(data: Omit<Inquiry, 'created_at' | 'updated_at'>): Promise<Inquiry> {
  const results = await query<Inquiry>(
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
  return results[0];
}

export async function updateInquiry(id: string, data: Partial<Omit<Inquiry, 'id' | 'created_at' | 'updated_at'>>): Promise<Inquiry> {
  const fields: string[] = [];
  const params: any[] = [];
  let paramIndex = 1;

  Object.entries(data).forEach(([key, value]) => {
    fields.push(`${key} = $${paramIndex++}`);
    params.push(value);
  });

  fields.push(`updated_at = NOW()`);
  params.push(id);

  const results = await query<Inquiry>(
    `UPDATE inquiries SET ${fields.join(', ')} WHERE id = $${paramIndex} RETURNING *`,
    params
  );
  return results[0];
}

export async function deleteInquiry(id: string): Promise<void> {
  await query('DELETE FROM inquiries WHERE id = $1', [id]);
}
