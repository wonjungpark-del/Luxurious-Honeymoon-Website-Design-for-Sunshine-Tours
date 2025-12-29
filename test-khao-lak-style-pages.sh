#!/bin/bash
# 카오락 스타일 페이지 테스트

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "============================================"
echo "카오락 스타일 페이지 비교 테스트"
echo "============================================"
echo ""

# 테스트할 페이지들
pages=("thailand-khao-lak" "danang" "fiji")
names=("카오락 (원본)" "다낭 (재생성)" "피지 (재생성)")

for i in "${!pages[@]}"; do
    page="${pages[$i]}"
    name="${names[$i]}"
    
    echo "테스트: $name"
    echo "─────────────────────────────────────────"
    
    # HTTP 상태
    status=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$page")
    echo "HTTP 상태: $status"
    
    # 구조 확인
    content=$(curl -s "$BASE_URL/$page")
    
    # Breadcrumb 확인
    if echo "$content" | grep -q 'class="breadcrumb"'; then
        echo "✅ Breadcrumb: 있음"
    else
        echo "❌ Breadcrumb: 없음"
    fi
    
    # destination-intro 확인
    if echo "$content" | grep -q 'class="destination-intro"'; then
        echo "✅ Intro Section: 있음"
    else
        echo "❌ Intro Section: 없음"
    fi
    
    # region-info 확인
    if echo "$content" | grep -q 'class="region-info"'; then
        echo "✅ Why Section: 있음"
    else
        echo "❌ Why Section: 없음"
    fi
    
    # resort-list 확인
    if echo "$content" | grep -q 'class="resort-list"'; then
        echo "✅ Resort List: 있음"
    else
        echo "❌ Resort List: 없음"
    fi
    
    # CTA 섹션 확인
    if echo "$content" | grep -q 'class="cta-section"'; then
        echo "✅ CTA Section: 있음"
    else
        echo "❌ CTA Section: 없음"
    fi
    
    # Lightbox 확인
    if echo "$content" | grep -q 'id="lightbox-modal"'; then
        echo "✅ Lightbox Modal: 있음"
    else
        echo "❌ Lightbox Modal: 없음"
    fi
    
    echo ""
done

echo "============================================"
echo "✅ 구조 비교 테스트 완료!"
echo "============================================"
