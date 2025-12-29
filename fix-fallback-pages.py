#!/usr/bin/env python3
"""
fallbackImg 변수를 사용하는 페이지의 메인 이미지 폴백 로직 수정
"""

import os
import re

# 수정할 페이지 목록
pages_to_fix = [
    'maldives.html',
    'boracay.html',
    'cebu.html',
    'palawan.html',
    'cancun.html',
]

def fix_fallback_image_logic(html_content):
    """
    fallbackImg 변수를 갤러리 첫 번째 이미지로 변경
    
    기존:
    const fallbackImg = 'https://images.unsplash.com/...';
    resort.main_image_url || fallbackImg
    
    수정:
    const mainImage = resort.main_image_url || (resort.gallery_images && resort.gallery_images.length > 0 ? resort.gallery_images[0] : 'https://images.unsplash.com/...');
    """
    
    # 패턴 1: const fallbackImg = '...'; 부분을 제거하고 inline으로 변경
    # 먼저 fallbackImg 선언을 찾아서 기본 이미지 URL 추출
    fallback_pattern = r"const fallbackImg\s*=\s*'([^']+)';"
    fallback_match = re.search(fallback_pattern, html_content)
    
    if not fallback_match:
        return html_content
    
    default_url = fallback_match.group(1)
    
    # fallbackImg 변수 선언 제거
    html_content = re.sub(fallback_pattern, '', html_content)
    
    # resort.main_image_url || fallbackImg 를 새로운 로직으로 교체
    old_pattern = r'\$\{resort\.main_image_url \|\| fallbackImg\}'
    new_code = f"${{resort.main_image_url || (resort.gallery_images && resort.gallery_images.length > 0 ? resort.gallery_images[0] : '{default_url}')}}"
    
    html_content = re.sub(old_pattern, new_code, html_content)
    
    # onerror의 fallbackImg도 교체
    html_content = re.sub(r"this\.src='?\$\{fallbackImg\}'?", f"this.src='{default_url}'", html_content)
    
    return html_content

def process_file(file_path):
    """파일 읽고 수정 후 저장"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 메인 이미지 폴백 로직 수정
        new_content = fix_fallback_image_logic(content)
        
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
    print("fallbackImg 변수 사용 페이지 메인 이미지 폴백 로직 수정")
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
    print("   - fallbackImg 변수를 갤러리 첫 번째 이미지 사용 로직으로 교체")
    print("   - 메인 이미지 → 갤러리 첫 이미지 → 기본 이미지 순서로 폴백")
    print()

if __name__ == '__main__':
    main()
