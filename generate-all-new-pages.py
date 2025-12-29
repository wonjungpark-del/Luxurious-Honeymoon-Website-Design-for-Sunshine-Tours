#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
신규 지역 페이지 생성 스크립트 (카오락 스타일)
남태평양 3개 + 유럽 8개 지역 HTML 페이지 자동 생성
"""

import json

# 지역 데이터 정의
REGIONS = [
    # 남태평양 3개
    {
        'id': 'region-southpacific-guam',
        'code': 'guam',
        'name_ko': '괌',
        'name_en': 'Guam',
        'subtitle': '미국령 태평양의 휴양지',
        'description': '미국령 태평양의 휴양지. 아름다운 비치와 워터 액티비티로 유명.',
        'breadcrumb': '남태평양',
        'features': [
            {'icon': 'fa-umbrella-beach', 'title': '투몬 비치', 'description': '에메랄드빛 바다와 흰 모래사장'},
            {'icon': 'fa-water', 'title': '워터 스포츠', 'description': '다이빙, 스노클링, 제트스키'},
            {'icon': 'fa-shopping-bag', 'title': '면세 쇼핑', 'description': 'DFS와 프리미엄 아울렛'}
        ]
    },
    {
        'id': 'region-southpacific-saipan',
        'code': 'saipan',
        'name_ko': '사이판',
        'name_en': 'Saipan',
        'subtitle': '북마리아나 제도의 천국',
        'description': '북마리아나 제도의 천국. 에메랄드 바다와 한적한 리조트.',
        'breadcrumb': '남태평양',
        'features': [
            {'icon': 'fa-water', 'title': '블루 호ール', 'description': '세계적인 다이빙 명소'},
            {'icon': 'fa-sun', 'title': '한적한 비치', 'description': '프라이빗한 해변 휴양'},
            {'icon': 'fa-umbrella-beach', 'title': '마나가하 섬', 'description': '스노클링과 해양 스포츠'}
        ]
    },
    {
        'id': 'region-southpacific-australia',
        'code': 'australia',
        'name_ko': '호주',
        'name_en': 'Australia',
        'subtitle': '그레이트 배리어 리프',
        'description': '그레이트 배리어 리프와 골드코스트. 세계적인 휴양지.',
        'breadcrumb': '남태평양',
        'features': [
            {'icon': 'fa-fish', 'title': '대보초', 'description': '세계 최대의 산호초 지대'},
            {'icon': 'fa-island-tropical', 'title': '프라이빗 아일랜드', 'description': '해밀턴 아일랜드의 럭셔리'},
            {'icon': 'fa-umbrella-beach', 'title': '골드코스트', 'description': '서핑과 비치 라이프'}
        ]
    },
    # 유럽 8개
    {
        'id': 'region-europe-paris',
        'code': 'paris',
        'name_ko': '파리',
        'name_en': 'Paris',
        'subtitle': '낭만의 도시, 에펠탑',
        'description': '낭만의 도시, 에펠탑과 센 강이 어우러진 예술의 도시.',
        'breadcrumb': '유럽',
        'features': [
            {'icon': 'fa-monument', 'title': '에펠탑', 'description': '파리의 상징, 로맨틱한 야경'},
            {'icon': 'fa-palette', 'title': '루브르 박물관', 'description': '세계 3대 박물관, 예술의 향연'},
            {'icon': 'fa-champagne-glasses', 'title': '샹젤리제', 'description': '럭셔리 쇼핑과 카페 문화'}
        ]
    },
    {
        'id': 'region-europe-rome',
        'code': 'rome',
        'name_ko': '로마',
        'name_en': 'Rome',
        'subtitle': '영원의 도시, 콜로세움',
        'description': '영원의 도시, 콜로세움과 고대 유적이 살아있는 곳.',
        'breadcrumb': '유럽',
        'features': [
            {'icon': 'fa-landmark', 'title': '콜로세움', 'description': '고대 로마의 상징'},
            {'icon': 'fa-church', 'title': '바티칸', 'description': '세계 최소 국가, 성 베드로 대성당'},
            {'icon': 'fa-pizza-slice', 'title': '이탈리안 요리', 'description': '파스타, 피자, 젤라또'}
        ]
    },
    {
        'id': 'region-europe-spain',
        'code': 'spain',
        'name_ko': '스페인',
        'name_en': 'Spain',
        'subtitle': '정열의 나라, 가우디',
        'description': '정열의 나라, 가우디와 플라멩코, 바르셀로나의 예술.',
        'breadcrumb': '유럽',
        'features': [
            {'icon': 'fa-church', 'title': '사그라다 파밀리아', 'description': '가우디의 미완성 걸작'},
            {'icon': 'fa-palette', 'title': '구엘 공원', 'description': '모자이크 타일의 환상'},
            {'icon': 'fa-music', 'title': '플라멩코', 'description': '스페인 전통 춤과 음악'}
        ]
    },
    {
        'id': 'region-europe-switzerland',
        'code': 'switzerland',
        'name_ko': '스위스',
        'name_en': 'Switzerland',
        'subtitle': '알프스의 보석',
        'description': '알프스의 보석, 융프라우와 마터호른의 절경.',
        'breadcrumb': '유럽',
        'features': [
            {'icon': 'fa-mountain', 'title': '융프라우', 'description': '유럽의 지붕, 만년설'},
            {'icon': 'fa-skiing', 'title': '스키 리조트', 'description': '체르마트, 생모리츠'},
            {'icon': 'fa-train', 'title': '파노라마 기차', 'description': '글래셔 익스프레스'}
        ]
    },
    {
        'id': 'region-europe-prague',
        'code': 'prague',
        'name_ko': '프라하',
        'name_en': 'Prague',
        'subtitle': '동화 같은 도시',
        'description': '동화 같은 도시, 중세 건축과 블타바 강의 아름다움.',
        'breadcrumb': '유럽',
        'features': [
            {'icon': 'fa-castle', 'title': '프라하 성', 'description': '세계에서 가장 큰 고대 성'},
            {'icon': 'fa-bridge', 'title': '카를교', 'description': '블타바 강의 역사적 다리'},
            {'icon': 'fa-clock', 'title': '천문시계', 'description': '600년 역사의 기계식 시계'}
        ]
    },
    {
        'id': 'region-europe-vienna',
        'code': 'vienna',
        'name_ko': '빈',
        'name_en': 'Vienna',
        'subtitle': '음악의 도시',
        'description': '음악의 도시, 모차르트와 합스부르크 왕가의 화려한 유산.',
        'breadcrumb': '유럽',
        'features': [
            {'icon': 'fa-music', 'title': '오페라 하우스', 'description': '세계 최고의 오페라'},
            {'icon': 'fa-crown', 'title': '쇤부른 궁전', 'description': '합스부르크 왕가의 여름 궁전'},
            {'icon': 'fa-mug-hot', 'title': '카페 문화', 'description': '사쉐르 토르테와 커피'}
        ]
    },
    {
        'id': 'region-europe-croatia',
        'code': 'croatia',
        'name_ko': '크로아티아',
        'name_en': 'Croatia',
        'subtitle': '아드리아해의 진주',
        'description': '아드리아해의 진주, 두브로브니크의 성벽과 푸른 바다.',
        'breadcrumb': '유럽',
        'features': [
            {'icon': 'fa-fort', 'title': '두브로브니크', 'description': '성벽 도시, 왕좌의 게임 촬영지'},
            {'icon': 'fa-water', 'title': '플리트비체', 'description': '16개 호수의 국립공원'},
            {'icon': 'fa-sailboat', 'title': '아드리아해', 'description': '에메랄드빛 크루즈'}
        ]
    },
    {
        'id': 'region-europe-turkey',
        'code': 'turkey',
        'name_ko': '터키',
        'name_en': 'Turkey',
        'subtitle': '동서양의 만남',
        'description': '동서양의 만남, 이스탄불과 카파도키아의 신비.',
        'breadcrumb': '유럽',
        'features': [
            {'icon': 'fa-mosque', 'title': '블루 모스크', 'description': '이스탄불의 상징'},
            {'icon': 'fa-hot-air-balloon', 'title': '카파도키아', 'description': '열기구와 동굴 호텔'},
            {'icon': 'fa-ship', 'title': '보스포러스', 'description': '유럽과 아시아를 잇는 해협'}
        ]
    }
]

# HTML 템플릿
HTML_TEMPLATE = '''<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{name_ko} 리조트 추천 | {subtitle} - 선샤인투어</title>
    <meta name="description" content="{name_ko} 최고의 럭셔리 리조트 추천. {description}">
    <meta name="keywords" content="{name_ko}, {name_ko} 리조트, {name_ko} 호텔, {name_ko} 허니문, {name_ko} 신혼여행, 선샤인투어">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;700&family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/destination.css">
    <link rel="stylesheet" href="/static/css/region.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="container">
            <div class="nav-brand">
                <a href="/index.html">SUNSHINE TOURS</a>
            </div>
            <ul class="nav-menu">
                <li><a href="/index.html">Home</a></li>
                <li><a href="/index.html#destinations">Destinations</a></li>
                <li><a href="/reviews.html">Reviews</a></li>
                <li><a href="/index.html#about">About</a></li>
                <li><a href="/inquiry.html" class="nav-cta">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- Breadcrumb -->
    <nav class="breadcrumb">
        <div class="container">
            <ul class="breadcrumb-list">
                <li><a href="/index.html"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="/index.html#destinations">{breadcrumb}</a></li>
                <li class="active">{name_ko}</li>
            </ul>
        </div>
    </nav>

    <!-- Destination Header/Intro -->
    <section class="destination-intro">
        <div class="container">
            <div class="intro-badge">{breadcrumb}</div>
            <h1 class="intro-title">{name_en_upper} RESORTS</h1>
            <h2 class="intro-subtitle">{name_ko} 최고의 리조트</h2>
            <p class="intro-description">{description}</p>
        </div>
    </section>

    <!-- Why This Destination -->
    <section class="region-info">
        <div class="container">
            <h2 class="section-title">WHY {name_en_upper}</h2>
            <div class="info-grid">
{features_html}
            </div>
        </div>
    </section>

    <!-- Resorts Section -->
    <section class="resort-list">
        <div class="container">
            <h2 class="section-title">{name_ko} 추천 리조트</h2>
            <div id="resorts-container">
                <!-- Resorts will be loaded dynamically -->
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
            <h2>지금 바로 {name_ko} 허니문을 계획하세요</h2>
            <p>전문 여행 컨설턴트가 맞춤 상담을 제공합니다</p>
            <a href="/inquiry.html" class="cta-button">무료 상담 신청</a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>SUNSHINE TOURS</h3>
                    <p>프리미엄 허니문 전문 여행사</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="footer-section">
                    <h4>여행지</h4>
                    <ul>
                        <li><a href="/index.html#destinations">태국</a></li>
                        <li><a href="/index.html#destinations">하와이</a></li>
                        <li><a href="/index.html#destinations">인도네시아</a></li>
                        <li><a href="/index.html#destinations">남태평양</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>고객센터</h4>
                    <ul>
                        <li><a href="/inquiry.html">문의하기</a></li>
                        <li><a href="/reviews.html">이용후기</a></li>
                        <li><a href="/admin.html">관리자</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>연락처</h4>
                    <p><i class="fas fa-phone"></i> 1234-5678</p>
                    <p><i class="fas fa-envelope"></i> info@sunshinetours.com</p>
                    <p><i class="fas fa-clock"></i> 평일 09:00 - 18:00</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Sunshine Tours. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Lightbox Modal -->
    <div id="lightbox-modal" class="lightbox-modal">
        <span class="lightbox-close">&times;</span>
        <img class="lightbox-content" id="lightbox-img">
        <div id="lightbox-caption"></div>
    </div>

    <!-- JavaScript -->
    <script>
        // Configuration
        const REGION_ID = '{region_id}';
        const API_BASE_URL = 'https://luxurious-honeymoon-website-design.vercel.app';

        // Category labels mapping
        const categoryLabels = {{
            'luxury': '럭셔리',
            'premium': '프리미엄',
            'standard': '스탠다드',
            '럭셔리': '럭셔리',
            '프리미엄': '프리미엄',
            '스탠다드': '스탠다드'
        }};

        // Load resorts on page load
        document.addEventListener('DOMContentLoaded', function() {{
            loadResorts();
        }});

        // Load resorts function
        async function loadResorts() {{
            const container = document.getElementById('resorts-container');
            
            try {{
                const response = await fetch(`${{API_BASE_URL}}/api/resorts?region_id=${{REGION_ID}}&is_active=true`);
                const result = await response.json();

                if (result.success && result.data && result.data.length > 0) {{
                    container.innerHTML = result.data.map(resort => createResortCard(resort)).join('');
                    
                    // Initialize lightbox after cards are created
                    initializeLightbox();
                }} else {{
                    container.innerHTML = `
                        <div class="no-resorts">
                            <i class="fas fa-info-circle"></i>
                            <p>현재 표시할 리조트가 없습니다.</p>
                        </div>
                    `;
                }}
            }} catch (error) {{
                console.error('Error loading resorts:', error);
                container.innerHTML = `
                    <div class="error-resorts">
                        <i class="fas fa-exclamation-triangle"></i>
                        <p>리조트 정보를 불러오는데 실패했습니다.</p>
                    </div>
                `;
            }}
        }}

        // Create resort card HTML
        function createResortCard(resort) {{
            const gallery = resort.gallery_images || [];
            const features = resort.features || [];
            const mainImage = gallery.length > 0 
                ? gallery[0] 
                : (resort.main_image_url || 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800');
            
            const categoryLabel = categoryLabels[resort.category] || resort.category;

            return `
                <div class="resort-card">
                    <div class="resort-header">
                        <div class="resort-image-container">
                            <img src="${{mainImage}}" 
                                 alt="${{resort.name_ko}}" 
                                 class="resort-image"
                                 onerror="this.src='https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800'">
                            <div class="resort-badge">${{categoryLabel}}</div>
                        </div>
                        <div class="resort-info">
                            <div class="resort-category">${{categoryLabel}}</div>
                            <h3 class="resort-name">${{resort.name_ko}}</h3>
                            <p class="resort-name-en">${{resort.name_en}}</p>
                            <p class="resort-description">${{resort.description}}</p>
                            
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
                            
                            <a href="/inquiry.html" class="resort-cta">문의하기</a>
                        </div>
                    </div>
                    
                    ${{gallery.length > 0 ? `
                        <div class="resort-gallery">
                            ${{gallery.slice(0, 6).map((img, index) => `
                                <div class="gallery-item" onclick="openLightbox('${{img}}', '${{resort.name_ko}} - 이미지 ${{index + 1}}')">
                                    <img src="${{img}}" 
                                         alt="${{resort.name_ko}} 갤러리 ${{index + 1}}"
                                         onerror="this.src='https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800'">
                                    <div class="gallery-overlay">
                                        <i class="fas fa-search-plus"></i>
                                    </div>
                                </div>
                            `).join('')}}
                        </div>
                    ` : ''}}
                </div>
            `;
        }}

        // Lightbox functions
        function initializeLightbox() {{
            const modal = document.getElementById('lightbox-modal');
            const closeBtn = document.querySelector('.lightbox-close');

            closeBtn.onclick = function() {{
                modal.style.display = 'none';
            }}

            modal.onclick = function(e) {{
                if (e.target === modal) {{
                    modal.style.display = 'none';
                }}
            }}
        }}

        function openLightbox(imgSrc, caption) {{
            const modal = document.getElementById('lightbox-modal');
            const modalImg = document.getElementById('lightbox-img');
            const captionText = document.getElementById('lightbox-caption');

            modal.style.display = 'block';
            modalImg.src = imgSrc;
            captionText.innerHTML = caption;
        }}
    </script>
</body>
</html>'''

def generate_features_html(features):
    """특징 섹션 HTML 생성"""
    html_parts = []
    for feature in features:
        html_parts.append(f'''                <div class="info-card">
                    <div class="info-icon">
                        <i class="fas {feature['icon']}"></i>
                    </div>
                    <h3 class="info-title">{feature['title']}</h3>
                    <p class="info-text">{feature['description']}</p>
                </div>''')
    return '\n'.join(html_parts)

def generate_page(region):
    """지역 페이지 생성"""
    features_html = generate_features_html(region['features'])
    
    html = HTML_TEMPLATE.format(
        region_id=region['id'],
        code=region['code'],
        name_ko=region['name_ko'],
        name_en=region['name_en'],
        name_en_upper=region['name_en'].upper(),
        subtitle=region['subtitle'],
        description=region['description'],
        breadcrumb=region['breadcrumb'],
        features_html=features_html
    )
    
    filename = f"public/{region['code']}.html"
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(html)
    
    print(f"✅ {region['name_ko']} 페이지 생성 완료: {filename}")

def main():
    print("="*50)
    print("신규 지역 페이지 생성 시작")
    print("="*50)
    
    for region in REGIONS:
        generate_page(region)
    
    print("="*50)
    print(f"✅ 총 {len(REGIONS)}개 페이지 생성 완료!")
    print("="*50)

if __name__ == '__main__':
    main()
