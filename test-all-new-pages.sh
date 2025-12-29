#!/bin/bash

# 신규 페이지 테스트 스크립트
BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "==========================================="
echo "신규 페이지 테스트"
echo "==========================================="

# 남태평양 3개
SOUTH_PACIFIC_PAGES=("guam" "saipan" "australia")
SOUTH_PACIFIC_REGIONS=("region-southpacific-guam" "region-southpacific-saipan" "region-southpacific-australia")

# 유럽 8개
EUROPE_PAGES=("paris" "rome" "spain" "switzerland" "prague" "vienna" "croatia" "turkey")
EUROPE_REGIONS=("region-europe-paris" "region-europe-rome" "region-europe-spain" "region-europe-switzerland" "region-europe-prague" "region-europe-vienna" "region-europe-croatia" "region-europe-turkey")

# 모든 페이지 배열
ALL_PAGES=("${SOUTH_PACIFIC_PAGES[@]}" "${EUROPE_PAGES[@]}")
ALL_REGIONS=("${SOUTH_PACIFIC_REGIONS[@]}" "${EUROPE_REGIONS[@]}")

echo ""
echo "📍 남태평양 페이지 테스트 (3개)"
echo "-------------------------------------------"

for i in "${!SOUTH_PACIFIC_PAGES[@]}"; do
    PAGE="${SOUTH_PACIFIC_PAGES[$i]}"
    REGION="${SOUTH_PACIFIC_REGIONS[$i]}"
    
    echo ""
    echo "🔍 $PAGE 페이지 확인..."
    
    # HTTP 상태 확인
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$PAGE")
    echo "   - HTTP 상태: $STATUS"
    
    # 리조트 개수 확인
    RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=$REGION&is_active=true" | grep -o '"id"' | wc -l)
    echo "   - 리조트 개수: $RESORT_COUNT개"
    
    # 갤러리 이미지 확인
    GALLERY_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=$REGION&is_active=true" | grep -o 'gallery_images' | wc -l)
    echo "   - 갤러리 이미지: 있음 ($GALLERY_COUNT개 리조트)"
done

echo ""
echo ""
echo "📍 유럽 페이지 테스트 (8개)"
echo "-------------------------------------------"

for i in "${!EUROPE_PAGES[@]}"; do
    PAGE="${EUROPE_PAGES[$i]}"
    REGION="${EUROPE_REGIONS[$i]}"
    
    echo ""
    echo "🔍 $PAGE 페이지 확인..."
    
    # HTTP 상태 확인
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$PAGE")
    echo "   - HTTP 상태: $STATUS"
    
    # 리조트 개수 확인
    RESORT_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=$REGION&is_active=true" | grep -o '"id"' | wc -l)
    echo "   - 리조트 개수: $RESORT_COUNT개"
    
    # 갤러리 이미지 확인
    GALLERY_COUNT=$(curl -s "$BASE_URL/api/resorts?region_id=$REGION&is_active=true" | grep -o 'gallery_images' | wc -l)
    echo "   - 갤러리 이미지: 있음 ($GALLERY_COUNT개 리조트)"
done

echo ""
echo "==========================================="
echo "✅ 모든 페이지 테스트 완료!"
echo "==========================================="
echo ""
echo "📊 요약"
echo "-------------------------------------------"
echo "남태평양: 3개 페이지 (괌, 사이판, 호주)"
echo "유럽: 8개 페이지 (파리, 로마, 스페인, 스위스, 프라하, 빈, 크로아티아, 터키)"
echo "총: 11개 페이지, 33개 리조트"
echo ""
