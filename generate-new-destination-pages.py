#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
신규 여행지 페이지 생성 스크립트
다낭, 피지, 보라보라, 산토리니, 아말피 페이지 생성
"""

import os

# 페이지 데이터 정의
pages_data = [
    {
        'filename': 'danang.html',
        'region_id': 'region-vietnam-danang',
        'title': '다낭 리조트 추천 | 베트남의 숨은 보석 - 선샤인투어',
        'description': '다낭의 프리미엄 리조트를 소개합니다. 인터컨티넨탈, 풀만 등 최고급 리조트에서 베트남 중부의 아름다운 해변과 문화를 경험하세요.',
        'keywords': '다낭, 다낭 리조트, 베트남 여행, 다낭 허니문, 논느억 해변, 인터컨티넨탈 다낭, 풀만 다낭',
        'hero_title': '다낭',
        'hero_subtitle': '베트남의 숨은 보석, 아름다운 해변과 문화 유산',
        'intro_title': '다낭에서의 특별한 시간',
        'intro_desc': '중부 베트남의 항구도시 다낭은 논느억 해변, 미케 해변 등 아름다운 해변과 참 문화 유적, 그리고 세계적 수준의 리조트가 어우러진 곳입니다.',
        'features': [
            {
                'icon': 'fa-water',
                'title': '아름다운 해변',
                'desc': '논느억, 미케 등 세계적인 해변'
            },
            {
                'icon': 'fa-landmark',
                'title': '문화 유산',
                'desc': '호이안, 미선 유적 등 UNESCO 세계문화유산'
            },
            {
                'icon': 'fa-utensils',
                'title': '베트남 미식',
                'desc': '신선한 해산물과 전통 베트남 요리'
            }
        ]
    },
    {
        'filename': 'fiji.html',
        'region_id': 'region-fiji',
        'title': '피지 리조트 추천 | 남태평양의 낙원 - 선샤인투어',
        'description': '피지의 프리미엄 오버워터 방갈로와 프라이빗 아일랜드 리조트를 소개합니다. 리쿨리쿠, 토코리키 등 럭셔리 리조트에서 완벽한 허니문을 즐기세요.',
        'keywords': '피지, 피지 리조트, 남태평양 여행, 피지 허니문, 오버워터 방갈로, 리쿨리쿠, 야사와 아일랜드',
        'hero_title': '피지',
        'hero_subtitle': '남태평양의 낙원, 333개 섬의 천국',
        'intro_title': '피지에서의 로맨틱한 순간',
        'intro_desc': '333개의 섬으로 이루어진 피지는 세계 최고의 다이빙 포인트, 오버워터 방갈로, 그리고 따뜻한 환대로 유명한 남태평양의 보석입니다.',
        'features': [
            {
                'icon': 'fa-home',
                'title': '오버워터 방갈로',
                'desc': '투명한 바다 위의 프라이빗 빌라'
            },
            {
                'icon': 'fa-water',
                'title': '세계적 다이빙',
                'desc': '산호초와 만타레이가 가득한 바다'
            },
            {
                'icon': 'fa-smile',
                'title': '따뜻한 환대',
                'desc': '\'Bula\'로 시작하는 피지인의 미소'
            }
        ]
    },
    {
        'filename': 'borabora.html',
        'region_id': 'region-tahiti-borabora',
        'title': '보라보라 리조트 추천 | 타히티의 진주 - 선샤인투어',
        'description': '보라보라의 최고급 오버워터 방갈로 리조트를 소개합니다. 포시즌스, 세인트레지스 등 럭셔리 리조트에서 세계에서 가장 아름다운 석호를 경험하세요.',
        'keywords': '보라보라, 타히티, 남태평양 여행, 보라보라 허니문, 오버워터 방갈로, 세인트레지스, 포시즌스',
        'hero_title': '보라보라',
        'hero_subtitle': '타히티의 진주, 세계에서 가장 아름다운 석호',
        'intro_title': '보라보라에서의 꿈같은 시간',
        'intro_desc': '에메랄드빛 석호와 오테마누 산이 어우러진 보라보라는 세계 최고의 오버워터 방갈로 리조트들이 모여있는 로맨틱한 섬입니다.',
        'features': [
            {
                'icon': 'fa-gem',
                'title': '세계 최고 석호',
                'desc': '에메랄드빛 투명한 바다'
            },
            {
                'icon': 'fa-hotel',
                'title': '럭셔리 리조트',
                'desc': '세계 최고급 오버워터 방갈로'
            },
            {
                'icon': 'fa-mountain',
                'title': '오테마누 산',
                'desc': '드라마틱한 화산 풍경'
            }
        ]
    },
    {
        'filename': 'santorini.html',
        'region_id': 'region-greece-santorini',
        'title': '산토리니 리조트 추천 | 에게해의 보석 - 선샤인투어',
        'description': '산토리니의 럭셔리 동굴 호텔과 부티크 리조트를 소개합니다. 카티키에스, 카나베스 오이아 등에서 세계 최고의 석양과 칼데라 뷰를 감상하세요.',
        'keywords': '산토리니, 그리스 여행, 산토리니 허니문, 오이아, 동굴 호텔, 칼데라 뷰, 에게해',
        'hero_title': '산토리니',
        'hero_subtitle': '에게해의 하얀 보석, 세계 최고의 석양',
        'intro_title': '산토리니에서의 로맨틱한 순간',
        'intro_desc': '하얀 건물과 푸른 돔이 어우러진 산토리니는 칼데라 석양, 에게해의 절경, 그리고 로맨틱한 분위기로 세계적으로 유명한 허니문 여행지입니다.',
        'features': [
            {
                'icon': 'fa-sun',
                'title': '세계 최고 석양',
                'desc': '오이아의 드라마틱한 선셋'
            },
            {
                'icon': 'fa-home',
                'title': '동굴 호텔',
                'desc': '칼데라 절벽의 럭셔리 호텔'
            },
            {
                'icon': 'fa-wine-glass',
                'title': '그리스 와인',
                'desc': '화산토에서 자란 독특한 와인'
            }
        ]
    },
    {
        'filename': 'amalfi.html',
        'region_id': 'region-italy-amalfi',
        'title': '아말피 코스트 리조트 추천 | 이탈리아의 해안 보석 - 선샤인투어',
        'description': '아말피 코스트의 럭셔리 호텔을 소개합니다. 모나스테로, 벨몬드 등 최고급 호텔에서 세계에서 가장 아름다운 해안선과 이탈리아 문화를 경험하세요.',
        'keywords': '아말피, 아말피 코스트, 이탈리아 여행, 포지타노, 아말피 허니문, 지중해, 이탈리아 리조트',
        'hero_title': '아말피 코스트',
        'hero_subtitle': '이탈리아 남부의 보석, 지중해의 절경',
        'intro_title': '아말피 코스트에서의 우아한 시간',
        'intro_desc': '가파른 절벽과 에메랄드빛 바다가 만나는 아말피 코스트는 포지타노, 아말피, 라벨로 등 아름다운 마을과 세계적인 리조트로 유명합니다.',
        'features': [
            {
                'icon': 'fa-mountain',
                'title': '절벽 풍경',
                'desc': '드라마틱한 해안 절벽의 마을들'
            },
            {
                'icon': 'fa-lemon',
                'title': '레몬 농장',
                'desc': '유명한 아말피 레몬과 리몬첼로'
            },
            {
                'icon': 'fa-church',
                'title': '역사 유적',
                'desc': 'UNESCO 세계문화유산'
            }
        ]
    }
]

def generate_page_html(data):
    """페이지 HTML 생성"""
    return f'''<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{data['title']}</title>
    <meta name="description" content="{data['description']}">
    <meta name="keywords" content="{data['keywords']}">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- CSS -->
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/destination.css">
    <link rel="stylesheet" href="/static/css/region.css">
</head>
<body>
    <!-- 네비게이션 -->
    <nav class="navbar">
        <div class="container">
            <a href="/" class="logo">
                <i class="fas fa-umbrella-beach"></i>
                Sunshine Tour
            </a>
            <ul class="nav-menu">
                <li><a href="/">홈</a></li>
                <li><a href="/thailand">태국</a></li>
                <li><a href="/hawaii">하와이</a></li>
                <li><a href="/indonesia">인도네시아</a></li>
                <li><a href="/about">소개</a></li>
                <li><a href="/contact">문의</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-region">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <h1 class="hero-title">{data['hero_title']}</h1>
            <p class="hero-subtitle">{data['hero_subtitle']}</p>
        </div>
    </section>

    <!-- 지역 소개 -->
    <section class="region-intro">
        <div class="container">
            <h2 class="section-title">{data['intro_title']}</h2>
            <p class="intro-text">{data['intro_desc']}</p>
        </div>
    </section>

    <!-- 특징 -->
    <section class="region-features">
        <div class="container">
            <div class="features-grid">
                {''.join([f'''
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas {feature['icon']}"></i>
                    </div>
                    <h3>{feature['title']}</h3>
                    <p>{feature['desc']}</p>
                </div>''' for feature in data['features']])}
            </div>
        </div>
    </section>

    <!-- 리조트 목록 -->
    <section class="resorts-section">
        <div class="container">
            <h2 class="section-title">추천 리조트</h2>
            <div id="resorts-container" class="resorts-grid">
                <div class="loading-message">
                    <i class="fas fa-spinner fa-spin"></i>
                    <p>리조트 정보를 불러오는 중...</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3><i class="fas fa-umbrella-beach"></i> Sunshine Tour</h3>
                    <p>세계 최고의 리조트에서 꿈같은 허니문을 만들어드립니다.</p>
                </div>
                <div class="footer-section">
                    <h4>바로가기</h4>
                    <ul>
                        <li><a href="/">홈</a></li>
                        <li><a href="/thailand">태국</a></li>
                        <li><a href="/hawaii">하와이</a></li>
                        <li><a href="/indonesia">인도네시아</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>문의</h4>
                    <p><i class="fas fa-phone"></i> 1588-0000</p>
                    <p><i class="fas fa-envelope"></i> info@sunshinetour.com</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Sunshine Tour. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Lightbox Modal -->
    <div id="lightbox" class="lightbox">
        <span class="lightbox-close">&times;</span>
        <img class="lightbox-content" id="lightbox-img">
        <div id="lightbox-caption"></div>
    </div>

    <script>
    // 지역 ID 설정
    const REGION_ID = '{data['region_id']}';
    const API_BASE = '/api/resorts';
    
    // 리조트 데이터 로드
    async function loadResorts() {{
        try {{
            const response = await fetch(`${{API_BASE}}?region_id=${{REGION_ID}}&is_active=true`);
            const result = await response.json();
            
            const container = document.getElementById('resorts-container');
            
            if (!result.success || !result.data || result.data.length === 0) {{
                container.innerHTML = `
                    <div class="no-resorts">
                        <p>현재 표시할 리조트가 없습니다.</p>
                    </div>
                `;
                return;
            }}
            
            const fallbackImg = 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=2080';
            const resorts = result.data;
            
            // 카테고리 라벨 매핑 (한글/영어 모두 지원)
            const categoryLabels = {{
                'luxury': '럭셔리',
                'premium': '프리미엄',
                'standard': '스탠다드',
                '럭셔리': '럭셔리',
                '프리미엄': '프리미엄',
                '스탠다드': '스탠다드'
            }};
            
            container.innerHTML = resorts.map(resort => {{
                const features = Array.isArray(resort.features) ? resort.features : [];
                const gallery = Array.isArray(resort.gallery_images) ? resort.gallery_images : [];
                const categoryLabel = categoryLabels[resort.category] || resort.category || 'RESORT';
                
                return `
                    <div class="resort-card">
                        <div class="resort-image">
                            <img src="${{resort.main_image_url || fallbackImg}}" 
                                 alt="${{resort.name_ko}}"
                                 onerror="this.src='${{fallbackImg}}'">
                            ${{resort.category ? `<span class="resort-badge">${{categoryLabel}}</span>` : ''}}
                        </div>
                        <div class="resort-info">
                            <span class="resort-category">${{categoryLabel}}</span>
                            <h3 class="resort-name">${{resort.name_ko}}</h3>
                            <p class="resort-description">${{resort.description || ''}}</p>
                            <div class="resort-features">
                                ${{features.slice(0, 4).map(f => `
                                    <span class="feature-tag">
                                        <i class="fas fa-check"></i> ${{f}}
                                    </span>
                                `).join('')}}
                            </div>
                            <div class="resort-gallery">
                                ${{gallery.slice(0, 6).map((img, idx) => `
                                    <img src="${{img}}" 
                                         alt="${{resort.name_ko}} - 이미지 ${{idx + 1}}"
                                         onclick="openLightbox('${{img}}', '${{resort.name_ko}} - 이미지 ${{idx + 1}}')"
                                         onerror="this.src='${{fallbackImg}}'">
                                `).join('')}}
                            </div>
                            <button class="resort-button" onclick="location.href='/contact'">
                                예약 문의 <i class="fas fa-arrow-right"></i>
                            </button>
                        </div>
                    </div>
                `;
            }}).join('');
            
        }} catch (error) {{
            console.error('리조트 로딩 실패:', error);
            document.getElementById('resorts-container').innerHTML = `
                <div class="error-message">
                    <p>리조트 정보를 불러오는데 실패했습니다. 잠시 후 다시 시도해주세요.</p>
                </div>
            `;
        }}
    }}
    
    // Lightbox 기능
    function openLightbox(imgSrc, caption) {{
        const lightbox = document.getElementById('lightbox');
        const lightboxImg = document.getElementById('lightbox-img');
        const lightboxCaption = document.getElementById('lightbox-caption');
        
        lightbox.style.display = 'block';
        lightboxImg.src = imgSrc;
        lightboxCaption.textContent = caption;
    }}
    
    // Lightbox 닫기
    document.querySelector('.lightbox-close').onclick = function() {{
        document.getElementById('lightbox').style.display = 'none';
    }};
    
    document.getElementById('lightbox').onclick = function(e) {{
        if (e.target.id === 'lightbox') {{
            this.style.display = 'none';
        }}
    }};
    
    // ESC 키로 닫기
    document.addEventListener('keydown', function(e) {{
        if (e.key === 'Escape') {{
            document.getElementById('lightbox').style.display = 'none';
        }}
    }});
    
    // 페이지 로드 시 리조트 데이터 로드
    document.addEventListener('DOMContentLoaded', loadResorts);
    </script>
</body>
</html>'''

# 페이지 생성
output_dir = '/home/user/webapp/public'
os.makedirs(output_dir, exist_ok=True)

for page_data in pages_data:
    filepath = os.path.join(output_dir, page_data['filename'])
    html_content = generate_page_html(page_data)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(html_content)
    
    print(f"✅ {page_data['filename']} 생성 완료 - {page_data['hero_title']}")

print("\n🎉 모든 신규 여행지 페이지 생성 완료!")
print("생성된 페이지: 다낭, 피지, 보라보라, 산토리니, 아말피")
