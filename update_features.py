#!/usr/bin/env python3
"""
Update resort features to 4 items max and remove star icons
"""
import json
import re
from pathlib import Path

# Feature list for each resort type
FEATURES = {
    'luxury': [
        '프라이빗 풀빌라',
        '미슐랭 스파',
        '고급 레스토랑',
        '24시간 버틀러'
    ],
    'premium': [
        '인피니티 풀',
        '프리미엄 스파',
        '다이닝 옵션',
        '키즈 클럽'
    ],
    'standard': [
        '수영장',
        '레스토랑',
        '피트니스 센터',
        '무료 WiFi'
    ]
}

def update_html_features(html_path):
    """Update features in HTML file"""
    with open(html_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Update CSS for features
    css_pattern = r'(\.features-title\s*\{[^}]+\})\s*(\.features-list\s*\{[^}]+\})\s*(\.feature-item\s*\{[^}]+\})\s*(\.feature-item\s+i\s*\{[^}]+\})'
    
    new_css = '''        .features-title {
            font-size: 0.95rem;
            font-weight: 600;
            color: #C9A96E;
            margin-bottom: 0.75rem;
        }
        
        .features-list {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 0.5rem;
        }
        
        .feature-item {
            display: flex;
            align-items: center;
            gap: 0.4rem;
            font-size: 0.9rem;
            color: #444;
        }
        
        .feature-item i {
            display: none; /* 별 아이콘 숨김 */
        }
        
        .feature-item::before {
            content: "•";
            color: #C9A96E;
            font-weight: 700;
            font-size: 1.2rem;
        }'''
    
    content = re.sub(css_pattern, new_css, content)
    
    # Update feature title to remove star icon
    content = re.sub(
        r'<div class="features-title"><i class="fas fa-star"></i> 주요 특징</div>',
        '<div class="features-title">주요 특징</div>',
        content
    )
    
    with open(html_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"✓ Updated: {html_path.name}")

# Update all region pages
public_dir = Path('/home/user/webapp/public')
region_files = list(public_dir.glob('thailand-*.html')) + \
               list(public_dir.glob('bali.html')) + \
               list(public_dir.glob('maldives.html')) + \
               list(public_dir.glob('cancun.html')) + \
               list(public_dir.glob('*-*.html'))

updated = 0
for html_file in region_files:
    if html_file.name not in ['admin.html', 'inquiry.html', 'reviews.html', 'index.html']:
        try:
            update_html_features(html_file)
            updated += 1
        except Exception as e:
            print(f"✗ Error updating {html_file.name}: {e}")

print(f"\n✅ Updated {updated} region pages")
