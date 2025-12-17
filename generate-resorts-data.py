#!/usr/bin/env python3
"""
Generate complete resort data for all remaining regions
"""

# Region definitions with their resort counts
REGIONS = {
    # Philippines (Already have Boracay 10, Cebu/Bohol 10 from previous file)
    'palawan': {
        'id': 'region-palawan',
        'name_ko': '팔라완',
        'name_en': 'Palawan',
        'count': 10,
        'resort_names_ko': [
            '두잇 팔마스 리조트', '엘니도 리조트', '코론 리조트', '푸에르토 프린세사 리조트',
            '클럽 파라다이스', '아풀릿 아일랜드', '미니록 아일랜드', '팡굴라시안',
            '라겐 아일랜드', '달루욘 비치 리조트'
        ],
        'resort_names_en': [
            'Dos Palmas Island Resort', 'El Nido Resorts', 'Busuanga Bay Lodge', 'Astoria Palawan',
            'Club Paradise Palawan', 'Apulit Island Resort', 'Miniloc Island Resort', 'Pangulasian Island Resort',
            'Lagen Island Resort', 'Daluyon Beach and Mountain Resort'
        ]
    },
    # Hawaii
    'oahu': {
        'id': 'region-oahu',
        'name_ko': '오아후',
        'name_en': 'Oahu',
        'count': 10,
        'resort_names_ko': [
            '더 카할라 호텔', '하레쿨라니', '모아나 서프라이더', '로얄 하와이안',
            '아웃리거 리프', '트럼프 와이키키', '힐튼 하와이안 빌리지', '하얏트 리젠시',
            '쉐라톤 와이키키', '프린스 와이키키'
        ],
        'resort_names_en': [
            'The Kahala Hotel & Resort', 'Halekulani', 'Moana Surfrider', 'The Royal Hawaiian',
            'Outrigger Reef Waikiki Beach Resort', 'Trump International Hotel Waikiki', 'Hilton Hawaiian Village',
            'Hyatt Regency Waikiki', 'Sheraton Waikiki', 'Prince Waikiki'
        ]
    },
    'maui': {
        'id': 'region-maui',
        'name_ko': '마우이',
        'name_en': 'Maui',
        'count': 10,
        'resort_names_ko': [
            '그랜드 와일레아', '포시즌스 와일레아', '앤다즈 마우이', '페어몬트 케아 라니',
            '웨스틴 마우이', '하얏트 리젠시 마우이', '몬타주 카팔루아', '리츠칼튼 카팔루아',
            '셰라톤 마우이', '와일레아 비치 리조트'
        ],
        'resort_names_en': [
            'Grand Wailea Resort', 'Four Seasons Resort Maui', 'Andaz Maui at Wailea Resort', 'Fairmont Kea Lani',
            'The Westin Maui Resort & Spa', 'Hyatt Regency Maui Resort', 'Montage Kapalua Bay', 'The Ritz-Carlton Kapalua',
            'Sheraton Maui Resort', 'Wailea Beach Resort'
        ]
    },
    'bigisland': {
        'id': 'region-bigisland',
        'name_ko': '빅아일랜드',
        'name_en': 'Big Island',
        'count': 10,
        'resort_names_ko': [
            '포시즌스 후알랄라이', '마우나 케아 비치', '마우나 라니', '페어몬트 오키드',
            '힐튼 와이콜로아 빌리지', '로얄 코나 리조트', '셰라톤 코나', '웨스틴 햅티나',
            '킹스 랜드', '코할라 코스트 리조트'
        ],
        'resort_names_en': [
            'Four Seasons Resort Hualalai', 'Mauna Kea Beach Hotel', 'Mauna Lani Resort', 'Fairmont Orchid',
            'Hilton Waikoloa Village', 'Royal Kona Resort', 'Sheraton Kona Resort', 'The Westin Hapuna Beach Resort',
            'Kings Land by Hilton', 'Kohala Coast Resort'
        ]
    },
    # South Pacific
    'fiji': {
        'id': 'region-fiji',
        'name_ko': '피지',
        'name_en': 'Fiji',
        'count': 10,
        'resort_names_ko': [
            '류쿠 리조트', '코코넛 비치 리조트', '플랜테이션 아일랜드', '힐튼 피지',
            '라디슨 블루', '쉐라톤 피지', '인터컨티넨탈 피지', '나누쿠 아일랜드',
            '마탕기 프라이빗 아일랜드', '토코릭 아일랜드'
        ],
        'resort_names_en': [
            'Likuliku Lagoon Resort', 'The Coconut Beach Club', 'Plantation Island Resort', 'Hilton Fiji Beach Resort',
            'Radisson Blu Resort Fiji', 'Sheraton Fiji Resort', 'InterContinental Fiji Golf Resort', 'Nanuku Auberge Resort',
            'Matangi Private Island Resort', 'Tokoriki Island Resort'
        ]
    },
    'guam': {
        'id': 'region-guam',
        'name_ko': '괌',
        'name_en': 'Guam',
        'count': 10,
        'resort_names_ko': [
            '두짓타니 괌', '힐튼 괌', '하얏트 리젠시 괌', '아웃리거 괌',
            '웨스틴 리조트 괌', 'PIC 괌', '오닉스 괌', '로얄 오키드 괌',
            '튜몬베이 캐피탈 호텔', '괌 리프 앤 올리브 스파'
        ],
        'resort_names_en': [
            'Dusit Thani Guam Resort', 'Hilton Guam Resort & Spa', 'Hyatt Regency Guam', 'Outrigger Guam Beach Resort',
            'The Westin Resort Guam', 'Pacific Islands Club Guam', 'ONYX Hotel Guam', 'Royal Orchid Guam Hotel',
            'Tumon Bay Capital Hotel', 'Guam Reef Hotel'
        ]
    },
    'saipan': {
        'id': 'region-saipan',
        'name_ko': '사이판',
        'name_en': 'Saipan',
        'count': 10,
        'resort_names_ko': [
            '칸타 팬퍼시픽', '피에스타 리조트', '아쿠아리우스 비치', '하얏트 리젠시 사이판',
            '마리아나 리조트', '코럴 오션 포인트', '사이판 월드 리조트', '그랜비리오 리조트',
            '켄싱턴 사이판', '파시 베이 호텔'
        ],
        'resort_names_en': [
            'Kensington Hotel Saipan', 'Fiesta Resort & Spa Saipan', 'Aquarius Beach Tower', 'Hyatt Regency Saipan',
            'Mariana Resort & Spa', 'Coral Ocean Point Resort', 'Saipan World Resort', 'Grandvrio Resort Saipan',
            'Kensington Resort Saipan', 'Paicî Bay Hotel'
        ]
    },
    'australia': {
        'id': 'region-australia',
        'name_ko': '호주',
        'name_en': 'Australia',
        'count': 10,
        'resort_names_ko': [
            '헤이먼 아일랜드', '퀄리아 해밀턴', '베드라 아일랜드', '리자드 아일랜드',
            '케언즈 샹그릴라', '풀만 리프 호텔', '힐튼 케언즈', '더글러스 샹그릴라',
            '시드니 파크 하얏트', '골드코스트 베르사체'
        ],
        'resort_names_en': [
            'Hayman Island Resort', 'Qualia Hamilton Island', 'Bedarra Island Resort', 'Lizard Island Resort',
            'Shangri-La Hotel Cairns', 'Pullman Reef Hotel Casino', 'Hilton Cairns', 'Shangri-La The Marina Cairns',
            'Park Hyatt Sydney', 'Palazzo Versace Gold Coast'
        ]
    },
    # Maldives
    'maldives': {
        'id': 'region-maldives',
        'name_ko': '몰디브',
        'name_en': 'Maldives',
        'count': 10,
        'resort_names_ko': [
            '소네바 푸시', '바로스 몰디브', '콘래드 랑갈리', '원앤온리 리티라',
            '벨라사루 몰디브', '센타라 라스 푸시', '아다란 프레스티지', '릴리 비치',
            '미리히 아일랜드', '쿠라마티 아일랜드'
        ],
        'resort_names_en': [
            'Soneva Fushi Resort', 'Baros Maldives', 'Conrad Maldives Rangali Island', 'One&Only Reethi Rah',
            'Velassaru Maldives', 'Centara Ras Fushi Resort', 'Adaaran Prestige Vadoo', 'Lily Beach Resort',
            'Mirihi Island Resort', 'Kuramathi Island Resort'
        ]
    },
    # Cancun
    'cancun': {
        'id': 'region-cancun',
        'name_ko': '칸쿤',
        'name_en': 'Cancun',
        'count': 10,
        'resort_names_ko': [
            '하얏트 지바 칸쿤', '문 팰리스 칸쿤', '르 블랑 스파 리조트', '씨크릿스 더 바인',
            '엑셀런스 플라야 무헤레스', '하드락 호텔 칸쿤', '리조트 라스 팔마스', '그랜드 피에스타 아메리카나',
            '리치몬드 리조트', 'JW 메리어트 칸쿤'
        ],
        'resort_names_en': [
            'Hyatt Ziva Cancun', 'Moon Palace Cancun', 'Le Blanc Spa Resort', 'Secrets The Vine Cancun',
            'Excellence Playa Mujeres', 'Hard Rock Hotel Cancun', 'Resort Las Palmas', 'Grand Fiesta Americana',
            'Fairmont Mayakoba', 'JW Marriott Cancun'
        ]
    },
    # Europe
    'paris': {
        'id': 'region-paris',
        'name_ko': '파리',
        'name_en': 'Paris',
        'count': 10,
        'resort_names_ko': [
            '르 므리디스 에투알', '포시즌스 조르주 생크', '리츠 파리', '플라자 아테네',
            '샹그릴라 파리', '르 로얄 몽소', '인터컨티넨탈 그랑', '파크 하얏트 파리',
            '망다랭 오리엔탈 파리', '르 브리스톨 파리'
        ],
        'resort_names_en': [
            'Le Méridien Étoile', 'Four Seasons Hotel George V', 'Ritz Paris', 'Hôtel Plaza Athénée',
            'Shangri-La Hotel Paris', 'Le Royal Monceau', 'InterContinental Paris Le Grand', 'Park Hyatt Paris-Vendôme',
            'Mandarin Oriental Paris', 'Le Bristol Paris'
        ]
    },
    'rome': {
        'id': 'region-rome',
        'name_ko': '로마',
        'name_en': 'Rome',
        'count': 10,
        'resort_names_ko': [
            '호텔 드 러셀', '호텔 하스 러', '에덴 호텔', '세인트 레지스 로마',
            '호텔 아르테미드', '베티카 팰리스', '그랜드 호텔 파크', '리츠 칼튼 로마',
            '비보스 보르게제', '호텔 드 빌라'
        ],
        'resort_names_en': [
            'Hotel De Russie', 'Hotel Hassler Roma', 'Hotel Eden Rome', 'The St. Regis Rome',
            'Hotel Artemide', 'Baglioni Hotel Regina', 'Gran Meliá Rome Villa Agrippina', 'The St. Regis Rome',
            'Boscolo Exedra Roma', 'Anantara Palazzo Naiadi Rome Hotel'
        ]
    },
    'spain': {
        'id': 'region-spain',
        'name_ko': '스페인',
        'name_en': 'Spain',
        'count': 10,
        'resort_names_ko': [
            '호텔 아르츠 바르셀로나', '만다린 오리엔탈 바르셀로나', '더블유 바르셀로나', '호텔 팰리스 바르셀로나',
            '리츠 칼튼 마드리드', '베스틴 팰리스 마드리드', '그랜 호텔 라 플로리다', '멜리아 마드리드',
            'AC 호텔 말라가', '베스틴 발렌시아'
        ],
        'resort_names_en': [
            'Hotel Arts Barcelona', 'Mandarin Oriental Barcelona', 'W Barcelona', 'Hotel Palace Barcelona',
            'The Ritz-Carlton Madrid', 'The Westin Palace Madrid', 'Gran Hotel La Florida', 'Meliá Madrid Serrano',
            'AC Hotel Malaga Palacio', 'The Westin Valencia'
        ]
    },
    'switzerland': {
        'id': 'region-switzerland',
        'name_ko': '스위스',
        'name_en': 'Switzerland',
        'count': 10,
        'resort_names_ko': [
            '바드러츠 팰리스', '그랜드 호텔 취르호프', '더 돌더 그랜드', '빅토리아 융프라우',
            '파크 하얏트 취리히', '베스틴 팰리스 밀라노', '켐핀스키 그랜드 호텔', '르 미라도',
            '샤토 구치', '페어몬트 르 몬트뢰'
        ],
        'resort_names_en': [
            'Badrutt\'s Palace Hotel', 'Grand Hotel Zermatterhof', 'The Dolder Grand', 'Victoria-Jungfrau Grand Hotel',
            'Park Hyatt Zurich', 'The Chedi Andermatt', 'Kempinski Grand Hotel des Bains', 'Le Mirador Resort',
            'Beau-Rivage Palace', 'Fairmont Le Montreux Palace'
        ]
    },
    'prague': {
        'id': 'region-prague',
        'name_ko': '프라하',
        'name_en': 'Prague',
        'count': 10,
        'resort_names_ko': [
            '포시즌스 프라하', '알키미스트 그랜드 호텔', '만다린 오리엔탈 프라하', '아우구스틴',
            '그랜드 호텔 보헤미아', '힐튼 프라하', '인터컨티넨탈 프라하', '코린시아 호텔',
            '모사익 하우스', '프레지던트 호텔'
        ],
        'resort_names_en': [
            'Four Seasons Hotel Prague', 'Alchymist Grand Hotel', 'Mandarin Oriental Prague', 'Augustine Hotel',
            'Grand Hotel Bohemia', 'Hilton Prague', 'InterContinental Prague', 'Corinthia Hotel Prague',
            'Mosaic House', 'Hotel President'
        ]
    },
    'vienna': {
        'id': 'region-vienna',
        'name_ko': '빈',
        'name_en': 'Vienna',
        'count': 10,
        'resort_names_ko': [
            '호텔 사허', '그랜드 호텔 빈', '임페리얼 빈', '리츠 칼튼 빈',
            '파크 하얏트 빈', '르 메르디양 빈', '힐튼 빈 플라자', '마리어트 빈',
            '인터컨티넨탈 빈', '앤다즈 빈'
        ],
        'resort_names_en': [
            'Hotel Sacher Wien', 'Grand Hotel Wien', 'Hotel Imperial Vienna', 'The Ritz-Carlton Vienna',
            'Park Hyatt Vienna', 'Le Méridien Vienna', 'Hilton Vienna Plaza', 'Vienna Marriott Hotel',
            'InterContinental Vienna', 'Andaz Vienna Am Belvedere'
        ]
    },
    'croatia': {
        'id': 'region-croatia',
        'name_ko': '크로아티아',
        'name_en': 'Croatia',
        'count': 10,
        'resort_names_ko': [
            '호텔 엑셀시어 두브로브니크', '힐튼 임페리얼 두브로브니크', '빌라 두브로브니크', '호텔 프레지던트',
            '르 메르디양 라브', '힐튼 자그레브', '에스플라나드 자그레브', '셰라톤 자그레브',
            '호텔 옴블라', '그랜드 빌라 아르헨티나'
        ],
        'resort_names_en': [
            'Hotel Excelsior Dubrovnik', 'Hilton Imperial Dubrovnik', 'Villa Dubrovnik', 'Hotel President',
            'Le Méridien Lav Split', 'Hilton Zagreb', 'Esplanade Zagreb Hotel', 'Sheraton Zagreb Hotel',
            'Hotel Ombla', 'Grand Villa Argentina'
        ]
    },
    'turkey': {
        'id': 'region-turkey',
        'name_ko': '터키',
        'name_en': 'Turkey',
        'count': 10,
        'resort_names_ko': [
            '포시즌스 이스탄불', '스위소텔 더 보스포러스', '리츠 칼튼 이스탄불', '힐튼 이스탄불',
            '마르단 팰리스', '레그넘 카르야', '힐튼 보드룸', '만다린 오리엔탈 보드룸',
            '베스틴 이스탄불', '그랜드 타라비아'
        ],
        'resort_names_en': [
            'Four Seasons Hotel Istanbul', 'Swissotel The Bosphorus', 'The Ritz-Carlton Istanbul', 'Hilton Istanbul Bosphorus',
            'Mardan Palace', 'Regnum Carya Golf & Spa Resort', 'Hilton Bodrum Turkbuku Resort', 'Mandarin Oriental Bodrum',
            'The Westin Istanbul', 'Grand Tarabya Hotel'
        ]
    },
    # Other
    'danang': {
        'id': 'region-danang',
        'name_ko': '다낭',
        'name_en': 'Da Nang',
        'count': 10,
        'resort_names_ko': [
            '인터컨티넨탈 다낭', '풀만 다낭', '푸라마 리조트', '프리미어 빌리지',
            '빈펄 리조트', '하얏트 리젠시 다낭', '쉐라톤 그랜드', '노보텔 다낭',
            '만다라 비치 리조트', '퓨전 마이아'
        ],
        'resort_names_en': [
            'InterContinental Danang Sun Peninsula', 'Pullman Danang Beach Resort', 'Furama Resort Danang', 'Premier Village Danang',
            'Vinpearl Resort & Spa', 'Hyatt Regency Danang', 'Sheraton Grand Danang', 'Novotel Danang Premier',
            'Mandala Beach Resort', 'Fusion Maia Resort'
        ]
    },
    'mauritius': {
        'id': 'region-mauritius',
        'name_ko': '모리셔스',
        'name_en': 'Mauritius',
        'count': 10,
        'resort_names_ko': [
            '샹그릴라 르 투에속', '원앤온리 르 생 제랑', '콘스탕스 벨 마레', '루쉬 마론 파라디',
            '롱 비치 리조트', '헤리티지 르 텔팍', '르 프린스 모리스', '디나로빈 리조트',
            '파라디 골프 리조트', '힐튼 모리셔스'
        ],
        'resort_names_en': [
            'Shangri-La Le Touessrok', 'One&Only Le Saint Géran', 'Constance Belle Mare Plage', 'LUX* Le Morne',
            'Long Beach Resort', 'Heritage Le Telfair Golf & Wellness Resort', 'Le Prince Maurice', 'Dinarobin Beachcomber',
            'Paradis Beachcomber Golf Resort', 'Hilton Mauritius Resort & Spa'
        ]
    },
}

RESORT_CATEGORIES = ['5성급 프리미엄', '5성급 럭셔리', '4.5성급 럭셔리', '4성급 스탠다드']

BASE_FEATURES = [
    ['프라이빗 비치', '스파', '인피니티풀', '고급 레스토랑'],
    ['비치프론트', '수영장', '레스토랑', '바'],
    ['수상 빌라', '다이빙', '스노클링', '카약'],
    ['가족 친화', '키즈클럽', '수영장', '레스토랑'],
    ['럭셔리 스파', '피트니스', '요가', '명상'],
]

UNSPLASH_IMAGES = [
    'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
    'https://images.unsplash.com/photo-1540541338287-41700207dee6',
    'https://images.unsplash.com/photo-1571896349842-33c89424de2d',
    'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
    'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9',
    'https://images.unsplash.com/photo-1584132967334-10e028bd69f7',
    'https://images.unsplash.com/photo-1616486338812-3dadae4b4ace',
    'https://images.unsplash.com/photo-1537996194471-e657df975ab4',
    'https://images.unsplash.com/photo-1566073771259-6a8506099945',
]

def escape_sql(text):
    """Escape single quotes for SQL"""
    return text.replace("'", "''")

def generate_resort_sql(region_key, resort_index):
    """Generate SQL INSERT statement for a single resort"""
    region = REGIONS[region_key]
    region_id = region['id']
    name_ko = escape_sql(region['resort_names_ko'][resort_index])
    name_en = escape_sql(region['resort_names_en'][resort_index])
    
    # Cycle through categories
    category = RESORT_CATEGORIES[resort_index % len(RESORT_CATEGORIES)]
    
    # Generate main and gallery images
    main_image = UNSPLASH_IMAGES[resort_index % len(UNSPLASH_IMAGES)] + '?w=800&q=70'
    gallery = [img + '?w=400&q=60' for img in UNSPLASH_IMAGES[0:7]]
    gallery_json = '[' + ','.join([f'"{img}"' for img in gallery]) + ']'
    
    # Select features
    features = BASE_FEATURES[resort_index % len(BASE_FEATURES)]
    features_json = '[' + ','.join([f'"{feat}"' for feat in features]) + ']'
    
    # Resort description
    description = escape_sql(f'{name_ko}는 {region["name_ko"]}의 럭셔리 리조트입니다.')
    
    # Resort ID
    resort_id = f'resort-{region_key}-{str(resort_index + 1).zfill(2)}'
    
    sql = f"""('{resort_id}', '{region_id}', '{name_ko}', '{name_en}', '{category}', '{description}', '{main_image}', '{gallery_json}', '{features_json}', {resort_index + 1}, 1, 1702742400000, 1702742400000)"""
    
    return sql

def generate_all_resorts():
    """Generate SQL for all resorts"""
    output = []
    
    for region_key, region_data in REGIONS.items():
        output.append(f"\n-- ==========================================")
        output.append(f"-- {region_data['name_en'].upper()} ({region_data['name_ko']}) - {region_data['count']} resorts")
        output.append(f"-- ==========================================\n")
        output.append("INSERT OR REPLACE INTO resorts (id, region_id, name_ko, name_en, category, description, main_image_url, gallery_images, features, display_order, is_active, created_at, updated_at)")
        output.append("VALUES")
        
        resort_sqls = []
        for i in range(region_data['count']):
            resort_sqls.append(generate_resort_sql(region_key, i))
        
        output.append(',\n\n'.join(resort_sqls) + ';')
    
    return '\n'.join(output)

if __name__ == '__main__':
    print(generate_all_resorts())
