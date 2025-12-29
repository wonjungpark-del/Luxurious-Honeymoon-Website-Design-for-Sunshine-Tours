#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
카오락 스타일로 다낭과 피지 페이지 재생성
"""

# 페이지 데이터
pages = [
    {
        'filename': 'danang.html',
        'region_id': 'region-vietnam-danang',
        'title': '베트남 다낭 리조트 추천 | 논느억 해변 허니문 - 선샤인투어',
        'description': '베트남 다낭 프리미엄 비치 리조트 전문. 논느억 해변과 미케 비치의 럭셔리 허니문, 27년 신뢰의 선샤인투어가 추천하는 다낭 최고급 리조트.',
        'keywords': '다낭, 다낭 리조트, 베트남 다낭, 다낭 허니문, 논느억 해변, 베트남 리조트, 선샤인투어, 다낭 여행, 미케 비치, 다낭 호텔',
        'breadcrumb_parent': '/destination-vietnam.html',
        'breadcrumb_parent_name': 'Vietnam',
        'breadcrumb_current': '다낭',
        'section_label': 'DANANG RESORTS',
        'section_title': '다낭 리조트',
        'intro_description': '중부 베트남의 항구도시 다낭은 논느억 해변, 미케 해변 등<br>아름다운 해변과 참 문화 유적, 그리고 세계적 수준의 리조트가<br>어우러진 베트남 최고의 비치 리조트 여행지입니다.',
        'why_label': 'WHY DANANG',
        'why_title': '다낭을 선택해야 하는 이유',
        'features': [
            {
                'icon': 'fa-water',
                'title': '아름다운 해변',
                'description': '논느억 해변, 미케 비치 등 세계적인 해변과 맑은 바다를 자랑합니다.'
            },
            {
                'icon': 'fa-landmark',
                'title': '문화 유산',
                'description': '호이안 고도시, 미선 유적 등 UNESCO 세계문화유산을 가까이에서 만날 수 있습니다.'
            },
            {
                'icon': 'fa-utensils',
                'title': '베트남 미식',
                'description': '신선한 해산물과 전통 베트남 요리로 미식가들의 천국입니다.'
            }
        ],
        'cta_title': '다낭에서 특별한 허니문을 시작하세요'
    },
    {
        'filename': 'fiji.html',
        'region_id': 'region-fiji',
        'title': '피지 리조트 추천 | 남태평양 오버워터 허니문 - 선샤인투어',
        'description': '피지 오버워터 방갈로 리조트 전문. 333개 섬의 천국에서 럭셔리 허니문, 27년 신뢰의 선샤인투어가 추천하는 피지 최고급 리조트.',
        'keywords': '피지, 피지 리조트, 남태평양 피지, 피지 허니문, 오버워터 방갈로, 남태평양 리조트, 선샤인투어, 피지 여행, 피지 다이빙, 피지 호텔',
        'breadcrumb_parent': '/destination-southpacific.html',
        'breadcrumb_parent_name': 'South Pacific',
        'breadcrumb_current': '피지',
        'section_label': 'FIJI RESORTS',
        'section_title': '피지 리조트',
        'intro_description': '333개의 섬으로 이루어진 피지는 남태평양의 보석입니다.<br>세계 최고의 다이빙 포인트, 오버워터 방갈로, 그리고<br>따뜻한 환대로 유명한 완벽한 허니문 여행지입니다.',
        'why_label': 'WHY FIJI',
        'why_title': '피지를 선택해야 하는 이유',
        'features': [
            {
                'icon': 'fa-home',
                'title': '오버워터 방갈로',
                'description': '투명한 바다 위의 프라이빗 빌라에서 로맨틱한 시간을 보낼 수 있습니다.'
            },
            {
                'icon': 'fa-water',
                'title': '세계적 다이빙',
                'description': '산호초와 만타레이가 가득한 세계 최고의 다이빙 포인트를 자랑합니다.'
            },
            {
                'icon': 'fa-smile',
                'title': '따뜻한 환대',
                'description': 'Bula로 시작하는 피지인의 미소와 따뜻한 환대가 여행을 더욱 특별하게 만듭니다.'
            }
        ],
        'cta_title': '피지에서 특별한 허니문을 시작하세요'
    }
]

# HTML 템플릿
def generate_html(page):
    return f'''<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{page['title']}</title>
    <meta name="description" content="{page['description']}">
    <meta name="keywords" content="{page['keywords']}">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300;400;600;700&family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/destination.css">
    <link rel="stylesheet" href="/static/css/region.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar" id="navbar">
        <div class="nav-container">
            <div class="nav-logo">
                <a href="/index.html">
                    <div class="logo-wrapper">
                        <div class="text-logo" style="display: flex; align-items: center; gap: 10px;">
                            <i class="fas fa-sun" style="font-size: 32px; color: #C9A96E;"></i>
                            <div style="display: flex; flex-direction: column; line-height: 1.2;">
                                <span style="font-family: 'Montserrat', sans-serif; font-size: 20px; font-weight: 700; color: #C9A96E; letter-spacing: 1px;">SUNSHINE</span>
                                <span style="font-family: 'Montserrat', sans-serif; font-size: 10px; font-weight: 400; color: #7A7A7A; letter-spacing: 2px;">TOUR</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <ul class="nav-menu" id="nav-menu">
                <li><a href="/index.html#home" class="nav-link">Home</a></li>
                <li><a href="/index.html#destinations" class="nav-link">Destinations</a></li>
                <li><a href="/reviews" class="nav-link">Reviews</a></li>
                <li><a href="/index.html#about" class="nav-link">About</a></li>
                <li><a href="/index.html#contact" class="nav-link">Contact</a></li>
            </ul>
            <div class="nav-toggle" id="nav-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </nav>

    <!-- Breadcrumb -->
    <section class="breadcrumb">
        <div class="container">
            <ul class="breadcrumb-list">
                <li><a href="/index.html">Home</a></li>
                <li><i class="fas fa-chevron-right"></i></li>
                <li><a href="{page['breadcrumb_parent']}">{page['breadcrumb_parent_name']}</a></li>
                <li><i class="fas fa-chevron-right"></i></li>
                <li class="current">{page['breadcrumb_current']}</li>
            </ul>
        </div>
    </section>

    <!-- Page Header -->
    <section class="destination-intro">
        <div class="container">
            <div class="intro-wrapper">
                <span class="section-label">{page['section_label']}</span>
                <h1 class="destination-section-title">{page['section_title']}</h1>
                <p class="destination-description">
                    {page['intro_description']}
                </p>
            </div>
        </div>
    </section>

    <!-- Why Section -->
    <section class="region-info" style="margin-top: 4rem;">
        <div class="container" style="max-width: 1200px; margin: 0 auto; padding: 0 2rem;">
            <div class="section-header" style="text-align: center; margin-bottom: 3rem;">
                <span class="section-label" style="color: #C9A96E; font-weight: 600; letter-spacing: 2px; font-size: 0.9rem;">{page['why_label']}</span>
                <h2 class="section-title" style="font-size: 2.5rem; color: #2C2C2C; margin-top: 1rem;">{page['why_title']}</h2>
            </div>
            
            <div class="region-meta" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 2rem; padding: 0;">
                {generate_features(page['features'])}
            </div>
        </div>
    </section>

    <!-- Resort List -->
    <section class="resort-list">
        <div class="container">
            <!-- Resorts will be loaded dynamically from database -->
            <div id="resorts-container">
                <div class="loading-resorts">
                    <i class="fas fa-spinner fa-spin"></i>
                    <p>리조트 정보를 불러오는 중...</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <div class="cta-content">
                <h2>{page['cta_title']}</h2>
                <p>전문 상담사가 여러분의 완벽한 여행을 계획해드립니다</p>
                <a href="/inquiry" class="cta-btn">문의하기</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-brand">
                    <h3>SUNSHINE TOUR</h3>
                    <p>프라이빗 허니문 전문 여행사</p>
                </div>
                
                <div class="footer-info">
                    <p>서울특별시 성북구 보문로30길 71, 2층 7호</p>
                    <p>TEL: 02-318-8021</p>
                    <p class="copyright">© 2024 Sunshine Tour. All rights reserved.</p>
                </div>
            </div>
        </div>
        
        <!-- Admin Access Button -->
        <div class="admin-access">
            <a href="/admin" class="admin-btn" title="관리자 페이지">
                <i class="fas fa-user-shield"></i>
                <span>Admin</span>
            </a>
        </div>
    </footer>

    <!-- Lightbox Modal -->
    <div id="lightbox-modal" class="lightbox-modal">
        <div class="lightbox-content">
            <span class="lightbox-close">&times;</span>
            <span class="lightbox-nav lightbox-prev">&#10094;</span>
            <img id="lightbox-img" src="" alt="">
            <span class="lightbox-nav lightbox-next">&#10095;</span>
            <div class="lightbox-caption" id="lightbox-caption"></div>
        </div>
    </div>

    <!-- JavaScript -->
    <script src="/static/js/main.js"></script>
    <script>
        // Load resorts for this region
        const REGION_ID = '{page['region_id']}';
        
        async function loadResorts() {{
            try {{
                const response = await fetch(`/api/resorts?region_id=${{REGION_ID}}&is_active=true`);
                const result = await response.json();
                
                const container = document.getElementById('resorts-container');
                
                if (result.success && result.data.length > 0) {{
                    const resorts = result.data;
                    
                    container.innerHTML = resorts.map(resort => {{
                        // Parse features and gallery
                        const features = Array.isArray(resort.features) ? resort.features : [];
                        const gallery = Array.isArray(resort.gallery_images) ? resort.gallery_images : [];
                        
                        // Category badge
                        const categoryLabels = {{
                            'luxury': '럭셔리',
                            'premium': '프리미엄',
                            'standard': '스탠다드',
                            '럭셔리': '럭셔리',
                            '프리미엄': '프리미엄',
                            '스탠다드': '스탠다드'
                        }};
                        
                        return `
                            <div class="resort-card">
                                <div class="resort-content-wrapper">
                                    <div class="resort-header">
                                        <div class="resort-image">
                                            <img src="${{resort.main_image_url || 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=2080'}}" alt="${{resort.name_ko}}">
                                            ${{resort.category ? `<div class="resort-badge">${{categoryLabels[resort.category] || resort.category}}</div>` : ''}}
                                        </div>
                                        <div class="resort-info">
                                            <div class="resort-category">${{categoryLabels[resort.category] || 'RESORT'}}</div>
                                            <h2 class="resort-name">${{resort.name_ko}}</h2>
                                            <p class="resort-description">${{resort.description || ''}}</p>
                                            ${{features.length > 0 ? `
                                                <div class="resort-features">
                                                    ${{features.slice(0, 4).map(feature => `
                                                        <div class="feature-item">
                                                            <i class="fas fa-check-circle"></i>
                                                            <span>${{feature}}</span>
                                                        </div>
                                                    `).join('')}}
                                                </div>
                                            ` : ''}}
                                            <a href="/inquiry" class="resort-cta">상담 신청하기</a>
                                        </div>
                                    </div>
                                    ${{gallery.length > 0 ? `
                                        <div class="resort-gallery">
                                            ${{gallery.slice(0, 6).map((img, index) => `
                                                <div class="gallery-item" onclick="openLightbox('${{img}}', '${{resort.name_ko}} - 이미지 ${{index + 1}}')">
                                                    <img src="${{img}}" alt="${{resort.name_ko}} - 이미지 ${{index + 1}}">
                                                    <div class="gallery-overlay">
                                                        <i class="fas fa-search-plus"></i>
                                                    </div>
                                                </div>
                                            `).join('')}}
                                        </div>
                                    ` : ''}}
                                </div>
                            </div>
                        `;
                    }}).join('');
                }} else {{
                    container.innerHTML = `
                        <div class="no-resorts">
                            <i class="fas fa-hotel"></i>
                            <p>현재 등록된 리조트가 없습니다.<br>곧 멋진 리조트들을 소개해드리겠습니다.</p>
                        </div>
                    `;
                }}
            }} catch (error) {{
                console.error('Error loading resorts:', error);
                document.getElementById('resorts-container').innerHTML = `
                    <div class="error-resorts">
                        <i class="fas fa-exclamation-circle"></i>
                        <p>리조트 정보를 불러오는데 실패했습니다.<br>잠시 후 다시 시도해주세요.</p>
                    </div>
                `;
            }}
        }}
        
        // Lightbox functionality
        function openLightbox(imgSrc, caption) {{
            const modal = document.getElementById('lightbox-modal');
            const img = document.getElementById('lightbox-img');
            const captionText = document.getElementById('lightbox-caption');
            
            modal.classList.add('active');
            img.src = imgSrc;
            captionText.textContent = caption;
            
            // Store current image for navigation
            window.currentLightboxImg = imgSrc;
        }}
        
        // Close lightbox
        document.querySelector('.lightbox-close').addEventListener('click', function() {{
            document.getElementById('lightbox-modal').classList.remove('active');
        }});
        
        // Close on background click
        document.getElementById('lightbox-modal').addEventListener('click', function(e) {{
            if (e.target === this) {{
                this.classList.remove('active');
            }}
        }});
        
        // Close on ESC key
        document.addEventListener('keydown', function(e) {{
            if (e.key === 'Escape') {{
                document.getElementById('lightbox-modal').classList.remove('active');
            }}
        }});
        
        // Load resorts on page load
        document.addEventListener('DOMContentLoaded', loadResorts);
    </script>
</body>
</html>'''

def generate_features(features):
    return '\n                '.join([
        f'''<div class="meta-item" style="text-align: center; padding: 2rem; background: #f8f9fa; border-radius: 12px;">
                    <div style="width: 80px; height: 80px; margin: 0 auto 1.5rem; background: linear-gradient(135deg, #C9A96E 0%, #B8935E 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                        <i class="fas {feature['icon']}" style="font-size: 2rem; color: white;"></i>
                    </div>
                    <h3 class="meta-label" style="font-size: 1.3rem; color: #2C2C2C; margin-bottom: 1rem; font-weight: 600;">{feature['title']}</h3>
                    <p class="meta-value" style="font-size: 1rem; color: #666; line-height: 1.6;">{feature['description']}</p>
                </div>'''
        for feature in features
    ])

# 페이지 생성
import os

output_dir = '/home/user/webapp/public'
for page in pages:
    filepath = os.path.join(output_dir, page['filename'])
    html = generate_html(page)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(html)
    
    print(f"✅ {page['filename']} 생성 완료 - {page['section_title']}")

print("\n🎉 모든 페이지 재생성 완료!")
print("생성된 페이지: 다낭, 피지")
