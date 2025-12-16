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

// ===================================
// 메인 페이지
// ===================================

app.get('/', (c) => {
  return c.html(`
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>선샤인투어 - 프리미엄 허니문 & 해외 여행 전문</title>
        <meta name="description" content="선샤인투어는 프리미엄 허니문과 해외 여행을 전문으로 하는 여행사입니다.">
        <meta name="keywords" content="허니문, 신혼여행, 해외여행, 리조트, 태국, 발리, 몰디브, 하와이">
        
        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&family=Noto+Serif+KR:wght@400;600;700&display=swap" rel="stylesheet">
        
        <!-- Font Awesome -->
        <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css" rel="stylesheet">
        
        <!-- Custom CSS -->
        <link href="/static/css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- Header & Navigation -->
        <header>
            <nav class="container">
                <div class="logo">
                    <a href="/">☀️ 선샤인투어</a>
                </div>
                <ul class="nav-links">
                    <li class="nav-dropdown">
                        <a href="#destinations">여행지 <i class="fas fa-chevron-down"></i></a>
                        <div class="dropdown-content">
                            <a href="/destinations/thailand">🇹🇭 태국</a>
                            <a href="/destinations/bali">🇮🇩 발리</a>
                            <a href="/destinations/maldives">🇲🇻 몰디브</a>
                            <a href="/destinations/hawaii">🇺🇸 하와이</a>
                            <a href="/destinations/philippines">🇵🇭 필리핀</a>
                            <a href="/destinations/europe">🇪🇺 유럽</a>
                        </div>
                    </li>
                    <li><a href="/reviews">후기</a></li>
                    <li><a href="/inquiry">문의하기</a></li>
                    <li><a href="/admin">관리자</a></li>
                </ul>
                <button class="mobile-menu-btn">
                    <i class="fas fa-bars"></i>
                </button>
            </nav>
        </header>

        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-content">
                <h1>당신만의 특별한 여행</h1>
                <p>프리미엄 허니문 & 해외 여행 전문</p>
                <div style="display: flex; gap: 1rem; justify-content: center;">
                    <a href="#destinations" class="btn btn-primary">여행지 둘러보기</a>
                    <a href="/inquiry" class="btn btn-secondary">상담 신청</a>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section class="container">
            <h2 class="section-title">선샤인투어를 선택하는 이유</h2>
            <p class="section-subtitle">20년 경력의 전문가가 만드는 완벽한 여행</p>
            
            <div class="card-grid">
                <div class="card">
                    <div class="card-content">
                        <i class="fas fa-award" style="font-size: 3rem; color: var(--primary-color); margin-bottom: 1rem;"></i>
                        <h3 class="card-title">20년 경력</h3>
                        <p class="card-description">허니문 및 해외 여행 전문 20년 경력의 노하우</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <i class="fas fa-heart" style="font-size: 3rem; color: var(--primary-color); margin-bottom: 1rem;"></i>
                        <h3 class="card-title">맞춤 상담</h3>
                        <p class="card-description">고객 한 분 한 분께 맞춤형 여행 플랜 제공</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <i class="fas fa-shield-alt" style="font-size: 3rem; color: var(--primary-color); margin-bottom: 1rem;"></i>
                        <h3 class="card-title">안전 보장</h3>
                        <p class="card-description">여행자 보험 및 24시간 긴급 지원 서비스</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <i class="fas fa-star" style="font-size: 3rem; color: var(--primary-color); margin-bottom: 1rem;"></i>
                        <h3 class="card-title">최고의 리조트</h3>
                        <p class="card-description">엄선된 프리미엄 리조트만을 제공합니다</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Popular Destinations -->
        <section class="container" id="destinations">
            <h2 class="section-title">인기 여행지</h2>
            <p class="section-subtitle">가장 많은 사랑을 받는 허니문 여행지</p>
            
            <div class="card-grid">
                <div class="card">
                    <img src="/static/images/destinations/thailand.jpg" alt="태국" class="card-image" onerror="this.src='https://via.placeholder.com/400x250?text=Thailand'">
                    <div class="card-content">
                        <h3 class="card-title">🇹🇭 태국</h3>
                        <p class="card-description">아름다운 해변과 럭셔리 리조트의 천국</p>
                        <a href="/destinations/thailand" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">자세히 보기</a>
                    </div>
                </div>
                <div class="card">
                    <img src="/static/images/destinations/bali.jpg" alt="발리" class="card-image" onerror="this.src='https://via.placeholder.com/400x250?text=Bali'">
                    <div class="card-content">
                        <h3 class="card-title">🇮🇩 발리</h3>
                        <p class="card-description">신들의 섬, 로맨틱한 허니문의 성지</p>
                        <a href="/destinations/bali" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">자세히 보기</a>
                    </div>
                </div>
                <div class="card">
                    <img src="/static/images/destinations/maldives.jpg" alt="몰디브" class="card-image" onerror="this.src='https://via.placeholder.com/400x250?text=Maldives'">
                    <div class="card-content">
                        <h3 class="card-title">🇲🇻 몰디브</h3>
                        <p class="card-description">일생에 한 번은 꼭 가야 할 천국의 섬</p>
                        <a href="/destinations/maldives" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">자세히 보기</a>
                    </div>
                </div>
                <div class="card">
                    <img src="/static/images/destinations/hawaii.jpg" alt="하와이" class="card-image" onerror="this.src='https://via.placeholder.com/400x250?text=Hawaii'">
                    <div class="card-content">
                        <h3 class="card-title">🇺🇸 하와이</h3>
                        <p class="card-description">태평양의 낙원, 완벽한 휴양지</p>
                        <a href="/destinations/hawaii" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">자세히 보기</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Reviews Section -->
        <section class="container" style="background-color: #f9f9f9; padding: 5rem 0;">
            <h2 class="section-title">고객 후기</h2>
            <p class="section-subtitle">선샤인투어와 함께한 행복한 순간들</p>
            
            <div id="reviews-container">
                <div class="loading">
                    <div class="spinner"></div>
                    <p>후기를 불러오는 중...</p>
                </div>
            </div>
            
            <div style="text-align: center; margin-top: 3rem;">
                <a href="/reviews" class="btn btn-primary">모든 후기 보기</a>
            </div>
        </section>

        <!-- Contact Section -->
        <section class="container">
            <h2 class="section-title">문의하기</h2>
            <p class="section-subtitle">궁금하신 점이 있으시면 언제든지 연락주세요</p>
            
            <div class="card-grid" style="max-width: 800px; margin: 0 auto;">
                <div class="card">
                    <div class="card-content" style="text-align: center;">
                        <i class="fas fa-phone" style="font-size: 3rem; color: var(--primary-color); margin-bottom: 1rem;"></i>
                        <h3 class="card-title">전화 문의</h3>
                        <p class="card-description">평일 09:00 - 18:00</p>
                        <a href="tel:02-1234-5678" style="color: var(--primary-color); font-size: 1.3rem; font-weight: 700;">02-1234-5678</a>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content" style="text-align: center;">
                        <i class="fas fa-envelope" style="font-size: 3rem; color: var(--primary-color); margin-bottom: 1rem;"></i>
                        <h3 class="card-title">이메일 문의</h3>
                        <p class="card-description">24시간 접수 가능</p>
                        <a href="mailto:info@sunshinetour.com" style="color: var(--primary-color); font-size: 1.1rem; font-weight: 700;">info@sunshinetour.com</a>
                    </div>
                </div>
            </div>
            
            <div style="text-align: center; margin-top: 3rem;">
                <a href="/inquiry" class="btn btn-primary" style="font-size: 1.2rem; padding: 1.2rem 3rem;">온라인 상담 신청</a>
            </div>
        </section>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="footer-content">
                    <div class="footer-section">
                        <h3>선샤인투어</h3>
                        <p>프리미엄 허니문 & 해외 여행 전문</p>
                        <p>20년 경력의 전문가가 만드는 완벽한 여행</p>
                    </div>
                    <div class="footer-section">
                        <h3>여행지</h3>
                        <p><a href="/destinations/thailand">태국</a></p>
                        <p><a href="/destinations/bali">발리</a></p>
                        <p><a href="/destinations/maldives">몰디브</a></p>
                        <p><a href="/destinations/hawaii">하와이</a></p>
                    </div>
                    <div class="footer-section">
                        <h3>고객 지원</h3>
                        <p><a href="/reviews">고객 후기</a></p>
                        <p><a href="/inquiry">문의하기</a></p>
                        <p><a href="/admin">관리자</a></p>
                    </div>
                    <div class="footer-section">
                        <h3>연락처</h3>
                        <p><i class="fas fa-phone"></i> 02-1234-5678</p>
                        <p><i class="fas fa-envelope"></i> info@sunshinetour.com</p>
                        <p><i class="fas fa-map-marker-alt"></i> 서울특별시 강남구</p>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>&copy; 2024 선샤인투어. All rights reserved.</p>
                </div>
            </div>
        </footer>

        <!-- Scripts -->
        <script src="/static/js/main.js"></script>
    </body>
    </html>
  `)
})

export default app
