import { Hono } from 'hono'
import { cors } from 'hono/cors'
import { serveStatic } from 'hono/cloudflare-workers'

type Bindings = {
  DB: D1Database;
}

const app = new Hono<{ Bindings: Bindings }>()

// CORS 설정
app.use('/api/*', cors())

// 정적 파일 제공
app.use('/static/*', serveStatic({ root: './public' }))

// ===================================
// API 엔드포인트 - Regions (지역)
// ===================================

// 지역 목록 조회
app.get('/api/regions', async (c) => {
  try {
    const { DB } = c.env
    const { country, is_active } = c.req.query()
    
    let query = 'SELECT * FROM regions'
    const conditions: string[] = []
    
    if (country) conditions.push(`country = '${country}'`)
    if (is_active) conditions.push(`is_active = ${is_active === 'true' ? 1 : 0}`)
    
    if (conditions.length > 0) {
      query += ' WHERE ' + conditions.join(' AND ')
    }
    
    query += ' ORDER BY display_order ASC, name_ko ASC'
    
    const result = await DB.prepare(query).all()
    
    return c.json({
      success: true,
      data: result.results || []
    })
  } catch (error) {
    console.error('Error fetching regions:', error)
    return c.json({
      success: false,
      error: 'Failed to fetch regions'
    }, 500)
  }
})

// 지역 상세 조회
app.get('/api/regions/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    
    const result = await DB.prepare('SELECT * FROM regions WHERE id = ?').bind(id).first()
    
    if (!result) {
      return c.json({
        success: false,
        error: 'Region not found'
      }, 404)
    }
    
    return c.json({
      success: true,
      data: result
    })
  } catch (error) {
    console.error('Error fetching region:', error)
    return c.json({
      success: false,
      error: 'Failed to fetch region'
    }, 500)
  }
})

// 지역 추가
app.post('/api/regions', async (c) => {
  try {
    const { DB } = c.env
    const body = await c.req.json()
    
    const id = `region-${Date.now()}`
    const now = Date.now()
    
    await DB.prepare(`
      INSERT INTO regions (id, code, country, name_ko, name_en, description, image_url, display_order, is_active, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `).bind(
      id,
      body.code,
      body.country,
      body.name_ko,
      body.name_en,
      body.description || '',
      body.image_url || '',
      body.display_order || 0,
      body.is_active !== false ? 1 : 0,
      now,
      now
    ).run()
    
    return c.json({
      success: true,
      data: { id, ...body }
    })
  } catch (error) {
    console.error('Error creating region:', error)
    return c.json({
      success: false,
      error: 'Failed to create region'
    }, 500)
  }
})

// 지역 수정
app.put('/api/regions/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    const body = await c.req.json()
    const now = Date.now()
    
    await DB.prepare(`
      UPDATE regions SET
        code = ?, country = ?, name_ko = ?, name_en = ?, description = ?,
        image_url = ?, display_order = ?, is_active = ?, updated_at = ?
      WHERE id = ?
    `).bind(
      body.code,
      body.country,
      body.name_ko,
      body.name_en,
      body.description || '',
      body.image_url || '',
      body.display_order || 0,
      body.is_active !== false ? 1 : 0,
      now,
      id
    ).run()
    
    return c.json({
      success: true,
      data: { id, ...body }
    })
  } catch (error) {
    console.error('Error updating region:', error)
    return c.json({
      success: false,
      error: 'Failed to update region'
    }, 500)
  }
})

// 지역 삭제
app.delete('/api/regions/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    
    await DB.prepare('DELETE FROM regions WHERE id = ?').bind(id).run()
    
    return c.json({
      success: true,
      message: 'Region deleted successfully'
    })
  } catch (error) {
    console.error('Error deleting region:', error)
    return c.json({
      success: false,
      error: 'Failed to delete region'
    }, 500)
  }
})

// ===================================
// API 엔드포인트 - Resorts (리조트)
// ===================================

// 리조트 목록 조회
app.get('/api/resorts', async (c) => {
  try {
    const { DB } = c.env
    const { region_id, is_active } = c.req.query()
    
    let query = 'SELECT * FROM resorts'
    const conditions: string[] = []
    
    if (region_id) conditions.push(`region_id = '${region_id}'`)
    if (is_active) conditions.push(`is_active = ${is_active === 'true' ? 1 : 0}`)
    
    if (conditions.length > 0) {
      query += ' WHERE ' + conditions.join(' AND ')
    }
    
    query += ' ORDER BY display_order ASC, name_ko ASC'
    
    const result = await DB.prepare(query).all()
    
    return c.json({
      success: true,
      data: result.results || []
    })
  } catch (error) {
    console.error('Error fetching resorts:', error)
    return c.json({
      success: false,
      error: 'Failed to fetch resorts'
    }, 500)
  }
})

// 리조트 상세 조회
app.get('/api/resorts/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    
    const result = await DB.prepare('SELECT * FROM resorts WHERE id = ?').bind(id).first()
    
    if (!result) {
      return c.json({
        success: false,
        error: 'Resort not found'
      }, 404)
    }
    
    return c.json({
      success: true,
      data: result
    })
  } catch (error) {
    console.error('Error fetching resort:', error)
    return c.json({
      success: false,
      error: 'Failed to fetch resort'
    }, 500)
  }
})

// 리조트 추가
app.post('/api/resorts', async (c) => {
  try {
    const { DB } = c.env
    const body = await c.req.json()
    
    const id = `resort-${Date.now()}`
    const now = Date.now()
    
    await DB.prepare(`
      INSERT INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `).bind(
      id,
      body.region_id,
      body.name_ko,
      body.name_en,
      body.category,
      body.description || '',
      body.main_image_url || '',
      JSON.stringify(body.gallery_images || []),
      JSON.stringify(body.features || []),
      body.display_order || 0,
      body.is_active !== false ? 1 : 0,
      now,
      now
    ).run()
    
    return c.json({
      success: true,
      data: { id, ...body }
    })
  } catch (error) {
    console.error('Error creating resort:', error)
    return c.json({
      success: false,
      error: 'Failed to create resort'
    }, 500)
  }
})

// 리조트 수정
app.put('/api/resorts/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    const body = await c.req.json()
    const now = Date.now()
    
    await DB.prepare(`
      UPDATE resorts SET
        region_id = ?, name_ko = ?, name_en = ?, category = ?, description = ?,
        main_image_url = ?, gallery_images = ?, features = ?, display_order = ?, is_active = ?, updated_at = ?
      WHERE id = ?
    `).bind(
      body.region_id,
      body.name_ko,
      body.name_en,
      body.category,
      body.description || '',
      body.main_image_url || '',
      JSON.stringify(body.gallery_images || []),
      JSON.stringify(body.features || []),
      body.display_order || 0,
      body.is_active !== false ? 1 : 0,
      now,
      id
    ).run()
    
    return c.json({
      success: true,
      data: { id, ...body }
    })
  } catch (error) {
    console.error('Error updating resort:', error)
    return c.json({
      success: false,
      error: 'Failed to update resort'
    }, 500)
  }
})

// 리조트 삭제
app.delete('/api/resorts/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    
    await DB.prepare('DELETE FROM resorts WHERE id = ?').bind(id).run()
    
    return c.json({
      success: true,
      message: 'Resort deleted successfully'
    })
  } catch (error) {
    console.error('Error deleting resort:', error)
    return c.json({
      success: false,
      error: 'Failed to delete resort'
    }, 500)
  }
})

// ===================================
// API 엔드포인트 - Reviews (후기)
// ===================================

// 후기 목록 조회
app.get('/api/reviews', async (c) => {
  try {
    const { DB } = c.env
    const { destination, status, is_featured } = c.req.query()
    
    let query = 'SELECT * FROM reviews'
    const conditions: string[] = []
    
    if (destination) conditions.push(`destination = '${destination}'`)
    if (status) conditions.push(`status = '${status}'`)
    if (is_featured) conditions.push(`is_featured = ${is_featured === 'true' ? 1 : 0}`)
    
    if (conditions.length > 0) {
      query += ' WHERE ' + conditions.join(' AND ')
    }
    
    query += ' ORDER BY created_at DESC'
    
    const result = await DB.prepare(query).all()
    
    return c.json({
      success: true,
      data: result.results || []
    })
  } catch (error) {
    console.error('Error fetching reviews:', error)
    return c.json({
      success: false,
      error: 'Failed to fetch reviews'
    }, 500)
  }
})

// 후기 상세 조회
app.get('/api/reviews/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    
    const result = await DB.prepare('SELECT * FROM reviews WHERE id = ?').bind(id).first()
    
    if (!result) {
      return c.json({
        success: false,
        error: 'Review not found'
      }, 404)
    }
    
    return c.json({
      success: true,
      data: result
    })
  } catch (error) {
    console.error('Error fetching review:', error)
    return c.json({
      success: false,
      error: 'Failed to fetch review'
    }, 500)
  }
})

// 후기 작성
app.post('/api/reviews', async (c) => {
  try {
    const { DB } = c.env
    const body = await c.req.json()
    
    const id = `review-${Date.now()}`
    const now = Date.now()
    
    await DB.prepare(`
      INSERT INTO reviews (id, destination, destination_kr, title, content, rating, author_name, travel_date, image_url, status, is_featured, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `).bind(
      id,
      body.destination,
      body.destination_kr,
      body.title,
      body.content,
      body.rating,
      body.author_name,
      body.travel_date,
      body.image_url || '',
      'pending',
      0,
      now,
      now
    ).run()
    
    return c.json({
      success: true,
      data: { id, ...body, status: 'pending' }
    })
  } catch (error) {
    console.error('Error creating review:', error)
    return c.json({
      success: false,
      error: 'Failed to create review'
    }, 500)
  }
})

// 후기 상태 변경
app.patch('/api/reviews/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    const body = await c.req.json()
    const now = Date.now()
    
    const updates: string[] = []
    const values: any[] = []
    
    if (body.status) {
      updates.push('status = ?')
      values.push(body.status)
    }
    if (body.is_featured !== undefined) {
      updates.push('is_featured = ?')
      values.push(body.is_featured ? 1 : 0)
    }
    
    updates.push('updated_at = ?')
    values.push(now)
    values.push(id)
    
    await DB.prepare(`UPDATE reviews SET ${updates.join(', ')} WHERE id = ?`).bind(...values).run()
    
    return c.json({
      success: true,
      message: 'Review updated successfully'
    })
  } catch (error) {
    console.error('Error updating review:', error)
    return c.json({
      success: false,
      error: 'Failed to update review'
    }, 500)
  }
})

// 후기 삭제
app.delete('/api/reviews/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    
    await DB.prepare('DELETE FROM reviews WHERE id = ?').bind(id).run()
    
    return c.json({
      success: true,
      message: 'Review deleted successfully'
    })
  } catch (error) {
    console.error('Error deleting review:', error)
    return c.json({
      success: false,
      error: 'Failed to delete review'
    }, 500)
  }
})

// ===================================
// API 엔드포인트 - Inquiries (문의)
// ===================================

// 문의 목록 조회
app.get('/api/inquiries', async (c) => {
  try {
    const { DB } = c.env
    const { status } = c.req.query()
    
    let query = 'SELECT * FROM inquiries'
    
    if (status) {
      query += ` WHERE status = '${status}'`
    }
    
    query += ' ORDER BY created_at DESC'
    
    const result = await DB.prepare(query).all()
    
    return c.json({
      success: true,
      data: result.results || []
    })
  } catch (error) {
    console.error('Error fetching inquiries:', error)
    return c.json({
      success: false,
      error: 'Failed to fetch inquiries'
    }, 500)
  }
})

// 문의 상세 조회
app.get('/api/inquiries/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    
    const result = await DB.prepare('SELECT * FROM inquiries WHERE id = ?').bind(id).first()
    
    if (!result) {
      return c.json({
        success: false,
        error: 'Inquiry not found'
      }, 404)
    }
    
    return c.json({
      success: true,
      data: result
    })
  } catch (error) {
    console.error('Error fetching inquiry:', error)
    return c.json({
      success: false,
      error: 'Failed to fetch inquiry'
    }, 500)
  }
})

// 문의 작성
app.post('/api/inquiries', async (c) => {
  try {
    const { DB } = c.env
    const body = await c.req.json()
    
    const id = `inquiry-${Date.now()}`
    const now = Date.now()
    
    await DB.prepare(`
      INSERT INTO inquiries (id, name, email, phone, destination, budget, travelers, departure_date, duration, subject, message, status, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `).bind(
      id,
      body.name,
      body.email,
      body.phone,
      body.destination,
      body.budget || '',
      body.travelers || 2,
      body.departure_date || '',
      body.duration || '',
      body.subject,
      body.message,
      'pending',
      now,
      now
    ).run()
    
    return c.json({
      success: true,
      data: { id, ...body, status: 'pending' }
    })
  } catch (error) {
    console.error('Error creating inquiry:', error)
    return c.json({
      success: false,
      error: 'Failed to create inquiry'
    }, 500)
  }
})

// 문의 상태 변경
app.patch('/api/inquiries/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    const body = await c.req.json()
    const now = Date.now()
    
    await DB.prepare(`
      UPDATE inquiries SET status = ?, updated_at = ? WHERE id = ?
    `).bind(body.status, now, id).run()
    
    return c.json({
      success: true,
      message: 'Inquiry updated successfully'
    })
  } catch (error) {
    console.error('Error updating inquiry:', error)
    return c.json({
      success: false,
      error: 'Failed to update inquiry'
    }, 500)
  }
})

// 문의 삭제
app.delete('/api/inquiries/:id', async (c) => {
  try {
    const { DB } = c.env
    const id = c.req.param('id')
    
    await DB.prepare('DELETE FROM inquiries WHERE id = ?').bind(id).run()
    
    return c.json({
      success: true,
      message: 'Inquiry deleted successfully'
    })
  } catch (error) {
    console.error('Error deleting inquiry:', error)
    return c.json({
      success: false,
      error: 'Failed to delete inquiry'
    }, 500)
  }
})

// API 라우트만 처리하고 나머지는 정적 파일(HTML)로 처리
// 메인 페이지는 public/index.html로 서빙됩니다

export default app
