#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
신규 지역 페이지 재생성 스크립트 (카오락 스타일 정확히 복사)
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
        'name_en_upper': 'GUAM',
        'subtitle': '미국령 태평양의 휴양지',
        'description': '''한적하고 아름다운 괌은 미국령 태평양의 휴양지입니다.<br>
투몬 비치와 워터 스포츠, 면세 쇼핑이 어우러진<br>
완벽한 허니문 여행지를 경험하세요.''',
        'breadcrumb': '남태평양',
        'breadcrumb_link': '/index.html#destinations',
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
        'name_en_upper': 'SAIPAN',
        'subtitle': '북마리아나 제도의 천국',
        'description': '''평화롭고 한적한 사이판은 북마리아나 제도의 천국입니다.<br>
블루 홀과 마나가하 섬, 프라이빗 비치가 어우러진<br>
로맨틱한 허니문을 경험하세요.''',
        'breadcrumb': '남태평양',
        'breadcrumb_link': '/index.html#destinations',
        'features': [
            {'icon': 'fa-water', 'title': '블루 홀', 'description': '세계적인 다이빙 명소'},
            {'icon': 'fa-sun', 'title': '한적한 비치', 'description': '프라이빗한 해변 휴양'},
            {'icon': 'fa-umbrella-beach', 'title': '마나가하 섬', 'description': '스노클링과 해양 스포츠'}
        ]
    },
    {
        'id': 'region-southpacific-australia',
        'code': 'australia',
        'name_ko': '호주',
        'name_en': 'Australia',
        'name_en_upper': 'AUSTRALIA',
        'subtitle': '그레이트 배리어 리프',
        'description': '''광활하고 아름다운 호주는 그레이트 배리어 리프의 나라입니다.<br>
대보초와 프라이빗 아일랜드, 골드코스트가 어우러진<br>
특별한 허니문을 경험하세요.''',
        'breadcrumb': '남태평양',
        'breadcrumb_link': '/index.html#destinations',
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
        'name_en_upper': 'PARIS',
        'subtitle': '낭만의 도시, 에펠탑',
        'description': '''낭만적이고 아름다운 파리는 에펠탑과 센 강의 도시입니다.<br>
루브르와 샹젤리제, 미슐랭 레스토랑이 어우러진<br>
꿈같은 허니문을 경험하세요.''',
        'breadcrumb': '유럽',
        'breadcrumb_link': '/index.html#destinations',
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
        'name_en_upper': 'ROME',
        'subtitle': '영원의 도시, 콜로세움',
        'description': '''역사적이고 웅장한 로마는 콜로세움과 고대 유적의 도시입니다.<br>
바티칸과 이탈리안 요리, 로마의 휴일이 어우러진<br>
영원한 허니문을 경험하세요.''',
        'breadcrumb': '유럽',
        'breadcrumb_link': '/index.html#destinations',
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
        'name_en_upper': 'SPAIN',
        'subtitle': '정열의 나라, 가우디',
        'description': '''정열적이고 화려한 스페인은 가우디와 플라멩코의 나라입니다.<br>
사그라다 파밀리아와 구엘 공원, 타파스가 어우러진<br>
열정적인 허니문을 경험하세요.''',
        'breadcrumb': '유럽',
        'breadcrumb_link': '/index.html#destinations',
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
        'name_en_upper': 'SWITZERLAND',
        'subtitle': '알프스의 보석',
        'description': '''아름답고 청정한 스위스는 알프스와 융프라우의 나라입니다.<br>
만년설과 스키 리조트, 파노라마 기차가 어우러진<br>
동화 같은 허니문을 경험하세요.''',
        'breadcrumb': '유럽',
        'breadcrumb_link': '/index.html#destinations',
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
        'name_en_upper': 'PRAGUE',
        'subtitle': '동화 같은 도시',
        'description': '''아름답고 중세적인 프라하는 블타바 강과 프라하 성의 도시입니다.<br>
카를교와 천문시계, 체코 맥주가 어우러진<br>
동화 같은 허니문을 경험하세요.''',
        'breadcrumb': '유럽',
        'breadcrumb_link': '/index.html#destinations',
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
        'name_en_upper': 'VIENNA',
        'subtitle': '음악의 도시',
        'description': '''우아하고 고전적인 빈은 모차르트와 합스부르크의 도시입니다.<br>
오페라 하우스와 쇤부른 궁전, 사쉐르 토르테가 어우러진<br>
우아한 허니문을 경험하세요.''',
        'breadcrumb': '유럽',
        'breadcrumb_link': '/index.html#destinations',
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
        'name_en_upper': 'CROATIA',
        'subtitle': '아드리아해의 진주',
        'description': '''아름답고 청명한 크로아티아는 두브로브니크와 아드리아해의 나라입니다.<br>
성벽 도시와 플리트비체, 크루즈가 어우러진<br>
에메랄드빛 허니문을 경험하세요.''',
        'breadcrumb': '유럽',
        'breadcrumb_link': '/index.html#destinations',
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
        'name_en_upper': 'TURKEY',
        'subtitle': '동서양의 만남',
        'description': '''신비롭고 이국적인 터키는 이스탄불과 카파도키아의 나라입니다.<br>
블루 모스크와 보스포러스, 열기구가 어우러진<br>
동서양 융합의 허니문을 경험하세요.''',
        'breadcrumb': '유럽',
        'breadcrumb_link': '/index.html#destinations',
        'features': [
            {'icon': 'fa-mosque', 'title': '블루 모스크', 'description': '이스탄불의 상징'},
            {'icon': 'fa-hot-air-balloon', 'title': '카파도키아', 'description': '열기구와 동굴 호텔'},
            {'icon': 'fa-ship', 'title': '보스포러스', 'description': '유럽과 아시아를 잇는 해협'}
        ]
    }
]

# HTML 템플릿 (카오락 스타일 정확히 복사)
HTML_TEMPLATE = '''<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{name_ko} 리조트 추천 | {subtitle} - 선샤인투어</title>
    <meta name="description" content="{name_ko} 최고의 럭셔리 리조트 추천. {subtitle}">
    <meta name="keywords" content="{name_ko}, {name_ko} 리조트, {name_ko} 호텔, {name_ko} 허니문, {name_ko} 신혼여행, 선샤인투어">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;700&family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    
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
                <li><a href="{breadcrumb_link}">{breadcrumb}</a></li>
                <li><i class="fas fa-chevron-right"></i></li>
                <li class="current">{name_ko}</li>
            </ul>
        </div>
    </section>

    <!-- Page Header -->
    <section class="destination-intro">
        <div class="container">
            <div class="intro-wrapper">
                <span class="section-label">{name_en_upper} RESORTS</span>
                <h1 class="destination-section-title">{name_ko} 리조트</h1>
                <p class="destination-description">
                    {description}
                </p>
            </div>
        </div>
    </section>

    <!-- Why This Destination Section -->
    <section class="region-info" style="margin-top: 4rem;">
        <div class="container" style="max-width: 1200px; margin: 0 auto; padding: 0 2rem;">
            <div class="section-header" style="text-align: center; margin-bottom: 3rem;">
                <span class="section-label" style="color: #C9A96E; font-weight: 600; letter-spacing: 2px; font-size: 0.9rem;">WHY {name_en_upper}</span>
                <h2 class="section-title" style="font-size: 2.5rem; color: #2C2C2C; margin-top: 1rem;">{name_ko}를 선택해야 하는 이유</h2>
            </div>
            
            <div class="region-meta" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 2rem; padding: 0;">
{features_html}
            </div>
        </div>
    </section>

    <!-- Resorts Section -->
    <section id="resorts" style="padding: 4rem 0; background: #fff;">
        <div class="container" style="max-width: 1200px; margin: 0 auto; padding: 0 2rem;">
            <div class="section-header" style="text-align: center; margin-bottom: 3rem;">
                <span class="section-label" style="color: #C9A96E; font-weight: 600; letter-spacing: 2px; font-size: 0.9rem;">{name_en_upper} ACCOMMODATIONS</span>
                <h2 class="section-title" style="font-size: 2.5rem; color: #2C2C2C; margin-top: 1rem;">{name_ko} 추천 리조트</h2>
            </div>
            
            <div id="resorts-container">
                <div style="text-align: center; padding: 3rem 0;">
                    <i class="fas fa-spinner fa-spin" style="font-size: 3rem; color: #C9A96E;"></i>
                    <p style="margin-top: 1rem; color: #666;">리조트 정보를 불러오는 중...</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section" style="background: linear-gradient(135deg, #C9A96E 0%, #B8935B 100%); padding: 4rem 0; text-align: center; color: white;">
        <div class="container">
            <h2 style="font-size: 2.5rem; margin-bottom: 1rem;">지금 바로 {name_ko} 허니문을 계획하세요</h2>
            <p style="font-size: 1.2rem; margin-bottom: 2rem; opacity: 0.95;">전문 여행 컨설턴트가 맞춤 상담을 제공합니다</p>
            <a href="/inquiry.html" style="display: inline-block; background: white; color: #C9A96E; padding: 1rem 3rem; border-radius: 50px; text-decoration: none; font-weight: 600; font-size: 1.1rem; transition: all 0.3s;">무료 상담 신청</a>
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
    </footer>

    <!-- Lightbox Modal -->
    <div id="lightboxModal" class="modal" style="display: none; position: fixed; z-index: 9999; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.9);">
        <span class="close" onclick="closeLightbox()" style="position: absolute; top: 20px; right: 35px; color: #f1f1f1; font-size: 40px; font-weight: bold; cursor: pointer;">&times;</span>
        <img class="modal-content" id="lightboxImg" style="margin: auto; display: block; max-width: 90%; max-height: 90%; margin-top: 50px;">
        <div id="caption" style="text-align: center; color: #ccc; padding: 20px; font-size: 1.2rem;"></div>
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
                }} else {{
                    container.innerHTML = `
                        <div style="text-align: center; padding: 3rem 0;">
                            <i class="fas fa-info-circle" style="font-size: 3rem; color: #C9A96E;"></i>
                            <p style="margin-top: 1rem; color: #666;">현재 표시할 리조트가 없습니다.</p>
                        </div>
                    `;
                }}
            }} catch (error) {{
                console.error('Error loading resorts:', error);
                container.innerHTML = `
                    <div style="text-align: center; padding: 3rem 0;">
                        <i class="fas fa-exclamation-triangle" style="font-size: 3rem; color: #ff6b6b;"></i>
                        <p style="margin-top: 1rem; color: #666;">리조트 정보를 불러오는데 실패했습니다.</p>
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
                <div class="resort-card" style="background: white; border-radius: 15px; overflow: hidden; box-shadow: 0 10px 40px rgba(0,0,0,0.1); margin-bottom: 3rem;">
                    <div class="resort-header" style="display: grid; grid-template-columns: 400px 1fr; gap: 2rem;">
                        <div class="resort-image" style="position: relative; height: 400px; overflow: hidden;">
                            <img src="${{mainImage}}" 
                                 alt="${{resort.name_ko}}" 
                                 style="width: 100%; height: 100%; object-fit: cover;"
                                 onerror="this.src='https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800'">
                            <span class="category-badge" style="position: absolute; top: 20px; right: 20px; background: linear-gradient(135deg, #C9A96E, #B8935B); color: white; padding: 0.5rem 1.5rem; border-radius: 50px; font-weight: 600; font-size: 0.9rem;">${{categoryLabel}}</span>
                        </div>
                        <div class="resort-info" style="padding: 2rem;">
                            <span style="color: #C9A96E; font-weight: 600; font-size: 0.9rem; letter-spacing: 1px;">${{categoryLabel.toUpperCase()}}</span>
                            <h3 style="font-size: 2.2rem; color: #2C2C2C; margin: 0.5rem 0;">${{resort.name_ko}}</h3>
                            <p style="color: #666; font-size: 1.05rem; line-height: 1.6; margin-bottom: 1.5rem;">${{resort.description}}</p>
                            
                            ${{features.length > 0 ? `
                                <div class="features" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 1rem; margin-bottom: 2rem;">
                                    ${{features.slice(0, 4).map(feature => `
                                        <div style="display: flex; align-items: center; gap: 0.8rem;">
                                            <i class="fas fa-check-circle" style="color: #C9A96E; font-size: 1.2rem;"></i>
                                            <span style="color: #555; font-size: 1rem;">${{feature}}</span>
                                        </div>
                                    `).join('')}}
                                </div>
                            ` : ''}}
                            
                            <a href="/inquiry.html" style="display: inline-block; background: linear-gradient(135deg, #C9A96E, #B8935B); color: white; padding: 1rem 2.5rem; border-radius: 50px; text-decoration: none; font-weight: 600; transition: all 0.3s;">문의하기</a>
                        </div>
                    </div>
                    
                    ${{gallery.length > 0 ? `
                        <div class="gallery" style="display: grid; grid-template-columns: repeat(6, 1fr); border-top: 1px solid #eee;">
                            ${{gallery.slice(0, 6).map((img, index) => `
                                <div style="position: relative; height: 180px; overflow: hidden; cursor: pointer; border-right: 1px solid #eee;" onclick="openLightbox('${{img}}', '${{resort.name_ko}} - 이미지 ${{index + 1}}')">
                                    <img src="${{img}}" 
                                         alt="${{resort.name_ko}} 갤러리 ${{index + 1}}"
                                         style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s;"
                                         onmouseover="this.style.transform='scale(1.1)'"
                                         onmouseout="this.style.transform='scale(1)'"
                                         onerror="this.src='https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800'">
                                    <div style="position: absolute; inset: 0; background: rgba(201, 169, 110, 0.8); display: flex; align-items: center; justify-content: center; opacity: 0; transition: opacity 0.3s;" onmouseover="this.style.opacity='1'" onmouseout="this.style.opacity='0'">
                                        <i class="fas fa-search-plus" style="color: white; font-size: 1.5rem;"></i>
                                    </div>
                                </div>
                            `).join('')}}
                        </div>
                    ` : ''}}
                </div>
            `;
        }}

        // Lightbox functions
        function openLightbox(imgSrc, caption) {{
            const modal = document.getElementById('lightboxModal');
            const modalImg = document.getElementById('lightboxImg');
            const captionText = document.getElementById('caption');

            modal.style.display = 'block';
            modalImg.src = imgSrc;
            captionText.innerHTML = caption;
        }}

        function closeLightbox() {{
            document.getElementById('lightboxModal').style.display = 'none';
        }}

        // Close lightbox when clicking outside the image
        document.getElementById('lightboxModal')?.addEventListener('click', function(e) {{
            if (e.target === this) {{
                closeLightbox();
            }}
        }});

        // Close lightbox with ESC key
        document.addEventListener('keydown', function(e) {{
            if (e.key === 'Escape') {{
                closeLightbox();
            }}
        }});
    </script>
</body>
</html>'''

def generate_features_html(features):
    """특징 섹션 HTML 생성 (카오락 스타일)"""
    html_parts = []
    for feature in features:
        html_parts.append(f'''                <div class="meta-card" style="background: white; padding: 2rem; border-radius: 15px; text-align: center; box-shadow: 0 5px 20px rgba(0,0,0,0.08); transition: transform 0.3s;" onmouseover="this.style.transform='translateY(-10px)'" onmouseout="this.style.transform='translateY(0)'">
                    <div class="icon" style="width: 70px; height: 70px; background: linear-gradient(135deg, #C9A96E, #B8935B); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 1.5rem;">
                        <i class="fas {feature['icon']}" style="font-size: 2rem; color: white;"></i>
                    </div>
                    <h3 style="font-size: 1.4rem; color: #2C2C2C; margin-bottom: 0.8rem;">{feature['title']}</h3>
                    <p style="color: #666; line-height: 1.6;">{feature['description']}</p>
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
        name_en_upper=region['name_en_upper'],
        subtitle=region['subtitle'],
        description=region['description'],
        breadcrumb=region['breadcrumb'],
        breadcrumb_link=region['breadcrumb_link'],
        features_html=features_html
    )
    
    filename = f"public/{region['code']}.html"
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(html)
    
    print(f"✅ {region['name_ko']} 페이지 재생성 완료: {filename}")

def main():
    print("="*50)
    print("신규 지역 페이지 재생성 (카오락 스타일)")
    print("="*50)
    
    for region in REGIONS:
        generate_page(region)
    
    print("="*50)
    print(f"✅ 총 {len(REGIONS)}개 페이지 재생성 완료!")
    print("="*50)

if __name__ == '__main__':
    main()
