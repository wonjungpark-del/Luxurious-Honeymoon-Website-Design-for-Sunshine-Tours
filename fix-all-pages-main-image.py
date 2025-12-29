#!/usr/bin/env python3
"""
전체 페이지 메인 이미지 폴백 로직 일괄 수정 스크립트
메인 이미지가 없을 때 갤러리 첫 번째 이미지를 사용하도록 수정
"""

import os
import re

# 수정할 페이지 목록
pages_to_fix = [
    # 태국 (6개)
    'thailand-phuket.html',
    'thailand-krabi.html',
    'thailand-koh-samui.html',
    'thailand-khao-lak.html',
    'thailand-pattaya.html',
    'thailand-hua-hin.html',
    
    # 하와이 (3개)
    'oahu.html',
    'maui.html',
    'bigisland.html',
    
    # 인도네시아 (2개)
    'bali.html',
    'lombok.html',
    
    # 몰디브 (1개)
    'maldives.html',
    
    # 필리핀 (3개)
    'boracay.html',
    'cebu.html',
    'palawan.html',
    
    # 멕시코 (1개)
    'cancun.html',
]

def fix_main_image_fallback(html_content):
    """
    메인 이미지 폴백 로직 수정
    기존: resort.main_image_url || 'unsplash URL'
    수정: resort.main_image_url || (resort.gallery_images && resort.gallery_images.length > 0 ? resort.gallery_images[0] : 'fallback URL')
    """
    
    # 패턴 1: resort.main_image_url || 'https://...' 형태
    pattern1 = r'resort\.main_image_url\s*\|\|\s*[\'"]https://[^\'"]+[\'"]'
    replacement1 = "resort.main_image_url || (resort.gallery_images && resort.gallery_images.length > 0 ? resort.gallery_images[0] : 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=2080')"
    
    html_content = re.sub(pattern1, replacement1, html_content)
    
    return html_content

def process_file(file_path):
    """파일 읽고 수정 후 저장"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 메인 이미지 폴백 로직 수정
        new_content = fix_main_image_fallback(content)
        
        # 변경사항이 있으면 저장
        if new_content != content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            return True
        else:
            return False
            
    except Exception as e:
        print(f"❌ 오류 발생: {file_path} - {str(e)}")
        return False

def main():
    print("=" * 70)
    print("전체 페이지 메인 이미지 폴백 로직 일괄 수정")
    print("=" * 70)
    print()
    
    public_dir = '/home/user/webapp/public'
    updated_count = 0
    skipped_count = 0
    
    for page_file in pages_to_fix:
        file_path = os.path.join(public_dir, page_file)
        
        if not os.path.exists(file_path):
            print(f"⚠️  파일 없음: {page_file}")
            skipped_count += 1
            continue
        
        if process_file(file_path):
            print(f"✅ 수정 완료: {page_file}")
            updated_count += 1
        else:
            print(f"⏭️  변경 없음: {page_file}")
            skipped_count += 1
    
    print()
    print("=" * 70)
    print("✅ 일괄 수정 완료")
    print("=" * 70)
    print(f"✅ 수정 완료: {updated_count}개")
    print(f"⏭️  변경 없음/스킵: {skipped_count}개")
    print(f"📊 총 처리: {updated_count + skipped_count}개")
    print()
    print("📝 수정 내용:")
    print("   - 메인 이미지가 없을 때 갤러리 첫 번째 이미지 사용")
    print("   - 갤러리도 없으면 기본 이미지 사용")
    print()

if __name__ == '__main__':
    main()
