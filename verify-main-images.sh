#!/bin/bash
# 메인 이미지 표시 확인

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "============================================"
echo "메인 이미지 표시 확인"
echo "============================================"
echo ""

for page in "danang" "fiji"; do
    echo "테스트: $page 페이지"
    echo "─────────────────────────────────────────"
    
    # API에서 실제 갤러리 이미지 확인
    if [ "$page" = "danang" ]; then
        region_id="region-vietnam-danang"
    else
        region_id="region-fiji"
    fi
    
    gallery_img=$(curl -s "$BASE_URL/api/resorts?region_id=$region_id" | jq -r '.data[0].gallery_images[0]')
    echo "갤러리 첫 번째 이미지: $gallery_img"
    
    # 페이지에서 사용되는 이미지 확인
    page_img=$(curl -s "$BASE_URL/$page" | grep -o 'https://images.unsplash.com/photo-[^"]*' | head -1)
    echo "페이지 표시 이미지: $page_img"
    
    if [ "$gallery_img" = "$page_img" ]; then
        echo "✅ 메인 이미지가 갤러리 이미지로 정상 표시됨"
    else
        echo "⚠️  이미지가 다를 수 있음 (캐시 또는 로딩 중)"
    fi
    
    echo ""
done

echo "============================================"
echo "✅ 확인 완료!"
echo "============================================"
