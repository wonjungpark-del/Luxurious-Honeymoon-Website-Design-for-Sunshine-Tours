import { sql } from '@vercel/postgres';

// Database helper functions
export const db = {
  // Generic query function
  async query<T = any>(query: string, params: any[] = []): Promise<{ rows: T[], rowCount: number }> {
    try {
      const result = await sql.query(query, params);
      return {
        rows: result.rows as T[],
        rowCount: result.rowCount || 0
      };
    } catch (error) {
      console.error('Database query error:', error);
      throw error;
    }
  },

  // Regions
  async getRegions(filters?: { country?: string, is_active?: boolean }) {
    let query = 'SELECT * FROM regions';
    const conditions: string[] = [];
    const params: any[] = [];
    
    if (filters?.country) {
      conditions.push(`country = $${params.length + 1}`);
      params.push(filters.country);
    }
    if (filters?.is_active !== undefined) {
      conditions.push(`is_active = $${params.length + 1}`);
      params.push(filters.is_active);
    }
    
    if (conditions.length > 0) {
      query += ' WHERE ' + conditions.join(' AND ');
    }
    
    query += ' ORDER BY display_order ASC, name_ko ASC';
    
    const result = await this.query(query, params);
    return result.rows;
  },

  async getRegionById(id: string) {
    const result = await this.query('SELECT * FROM regions WHERE id = $1', [id]);
    return result.rows[0] || null;
  },

  async createRegion(data: any) {
    const id = `region-${Date.now()}`;
    const now = new Date().toISOString();
    
    const result = await this.query(
      `INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *`,
      [
        id,
        data.code,
        data.country,
        data.name_ko,
        data.name_en,
        data.description || '',
        data.image_url || '',
        data.display_order || 0,
        data.is_active !== false,
        now,
        now
      ]
    );
    
    return result.rows[0];
  },

  async updateRegion(id: string, data: any) {
    const now = new Date().toISOString();
    
    const result = await this.query(
      `UPDATE regions SET
        code = $1, country = $2, name_ko = $3, name_en = $4, description = $5,
        image_url = $6, display_order = $7, is_active = $8, updated_at = $9
       WHERE id = $10 RETURNING *`,
      [
        data.code,
        data.country,
        data.name_ko,
        data.name_en,
        data.description || '',
        data.image_url || '',
        data.display_order || 0,
        data.is_active !== false,
        now,
        id
      ]
    );
    
    return result.rows[0];
  },

  async deleteRegion(id: string) {
    await this.query('DELETE FROM regions WHERE id = $1', [id]);
    return { success: true };
  },

  // Resorts
  async getResorts(filters?: { region_id?: string, is_active?: boolean }) {
    let query = 'SELECT * FROM resorts';
    const conditions: string[] = [];
    const params: any[] = [];
    
    if (filters?.region_id) {
      conditions.push(`region_id = $${params.length + 1}`);
      params.push(filters.region_id);
    }
    if (filters?.is_active !== undefined) {
      conditions.push(`is_active = $${params.length + 1}`);
      params.push(filters.is_active);
    }
    
    if (conditions.length > 0) {
      query += ' WHERE ' + conditions.join(' AND ');
    }
    
    query += ' ORDER BY display_order ASC, name_ko ASC';
    
    const result = await this.query(query, params);
    return result.rows;
  },

  async getResortById(id: string) {
    const result = await this.query('SELECT * FROM resorts WHERE id = $1', [id]);
    return result.rows[0] || null;
  },

  async createResort(data: any) {
    const id = `resort-${Date.now()}`;
    const now = new Date().toISOString();
    
    const result = await this.query(
      `INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) RETURNING *`,
      [
        id,
        data.region_id,
        data.name_ko,
        data.name_en,
        data.category,
        data.description || '',
        data.main_image_url || '',
        JSON.stringify(data.gallery_images || []),
        JSON.stringify(data.features || []),
        data.display_order || 0,
        data.is_active !== false,
        now,
        now
      ]
    );
    
    return result.rows[0];
  },

  async updateResort(id: string, data: any) {
    const now = new Date().toISOString();
    
    const result = await this.query(
      `UPDATE resorts SET
        region_id = $1, name_ko = $2, name_en = $3, category = $4, description = $5,
        main_image_url = $6, gallery_images = $7, features = $8, display_order = $9, is_active = $10, updated_at = $11
       WHERE id = $12 RETURNING *`,
      [
        data.region_id,
        data.name_ko,
        data.name_en,
        data.category,
        data.description || '',
        data.main_image_url || '',
        JSON.stringify(data.gallery_images || []),
        JSON.stringify(data.features || []),
        data.display_order || 0,
        data.is_active !== false,
        now,
        id
      ]
    );
    
    return result.rows[0];
  },

  async deleteResort(id: string) {
    await this.query('DELETE FROM resorts WHERE id = $1', [id]);
    return { success: true };
  },

  // Reviews
  async getReviews(filters?: { destination?: string, status?: string, is_featured?: boolean }) {
    let query = 'SELECT * FROM reviews';
    const conditions: string[] = [];
    const params: any[] = [];
    
    if (filters?.destination) {
      conditions.push(`destination = $${params.length + 1}`);
      params.push(filters.destination);
    }
    if (filters?.status) {
      conditions.push(`status = $${params.length + 1}`);
      params.push(filters.status);
    }
    if (filters?.is_featured !== undefined) {
      conditions.push(`is_featured = $${params.length + 1}`);
      params.push(filters.is_featured);
    }
    
    if (conditions.length > 0) {
      query += ' WHERE ' + conditions.join(' AND ');
    }
    
    query += ' ORDER BY created_at DESC';
    
    const result = await this.query(query, params);
    return result.rows;
  },

  async getReviewById(id: string) {
    const result = await this.query('SELECT * FROM reviews WHERE id = $1', [id]);
    return result.rows[0] || null;
  },

  async createReview(data: any) {
    const id = `review-${Date.now()}`;
    const now = new Date().toISOString();
    
    const result = await this.query(
      `INSERT INTO reviews (id, destination, destination_kr, title, content, rating, author_name, travel_date, image_url, status, is_featured, created_at, updated_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) RETURNING *`,
      [
        id,
        data.destination,
        data.destination_kr,
        data.title,
        data.content,
        data.rating,
        data.author_name,
        data.travel_date,
        data.image_url || '',
        'pending',
        false,
        now,
        now
      ]
    );
    
    return result.rows[0];
  },

  async updateReview(id: string, data: any) {
    const now = new Date().toISOString();
    const updates: string[] = [];
    const params: any[] = [];
    
    if (data.status) {
      updates.push(`status = $${params.length + 1}`);
      params.push(data.status);
    }
    if (data.is_featured !== undefined) {
      updates.push(`is_featured = $${params.length + 1}`);
      params.push(data.is_featured);
    }
    
    updates.push(`updated_at = $${params.length + 1}`);
    params.push(now);
    params.push(id);
    
    const result = await this.query(
      `UPDATE reviews SET ${updates.join(', ')} WHERE id = $${params.length} RETURNING *`,
      params
    );
    
    return result.rows[0];
  },

  async deleteReview(id: string) {
    await this.query('DELETE FROM reviews WHERE id = $1', [id]);
    return { success: true };
  },

  // Inquiries
  async getInquiries(filters?: { status?: string }) {
    let query = 'SELECT * FROM inquiries';
    const params: any[] = [];
    
    if (filters?.status) {
      query += ' WHERE status = $1';
      params.push(filters.status);
    }
    
    query += ' ORDER BY created_at DESC';
    
    const result = await this.query(query, params);
    return result.rows;
  },

  async getInquiryById(id: string) {
    const result = await this.query('SELECT * FROM inquiries WHERE id = $1', [id]);
    return result.rows[0] || null;
  },

  async createInquiry(data: any) {
    const id = `inquiry-${Date.now()}`;
    const now = new Date().toISOString();
    
    const result = await this.query(
      `INSERT INTO inquiries (id, name, email, phone, destination, budget, travelers, departure_date, duration, subject, message, status, created_at, updated_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) RETURNING *`,
      [
        id,
        data.name,
        data.email,
        data.phone,
        data.destination,
        data.budget || '',
        data.travelers || 2,
        data.departure_date || '',
        data.duration || '',
        data.subject,
        data.message,
        'pending',
        now,
        now
      ]
    );
    
    return result.rows[0];
  },

  async updateInquiry(id: string, data: any) {
    const now = new Date().toISOString();
    
    const result = await this.query(
      `UPDATE inquiries SET status = $1, updated_at = $2 WHERE id = $3 RETURNING *`,
      [data.status, now, id]
    );
    
    return result.rows[0];
  },

  async deleteInquiry(id: string) {
    await this.query('DELETE FROM inquiries WHERE id = $1', [id]);
    return { success: true };
  }
};
