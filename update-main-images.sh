#!/bin/bash

echo "🖼️  모든 리조트 메인 이미지를 안전한 샘플로 업데이트..."
echo ""

# 안전한 Unsplash 리조트 이미지들 (다양한 스타일)
MAIN_IMAGES=(
  "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=1200&q=80"  # 발리 리조트
  "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=1200&q=80"  # 비치 리조트
  "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=1200&q=80"  # 수상 빌라
  "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=1200&q=80"  # 럭셔리 호텔
  "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=1200&q=80"  # 풀 빌라
  "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=1200&q=80"  # 리조트 풀
  "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=1200&q=80"  # 리조트 다이닝
  "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=1200&q=80"  # 스파
  "https://images.unsplash.com/photo-1549294413-26f195200c16?w=1200&q=80"  # 비치 전망
  "https://images.unsplash.com/photo-1602002418082-a4443e081dd1?w=1200&q=80"  # 트로피칼 리조트
)

# 모든 리조트 가져오기
echo "🔍 모든 리조트 검색 중..."
ALL_RESORTS=$(curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" | jq -r '.data[] | .id')

COUNT=0
INDEX=0

for resort_id in $ALL_RESORTS; do
  # 이미지 순환 선택
  IMAGE_URL="${MAIN_IMAGES[$INDEX]}"
  INDEX=$(( (INDEX + 1) % ${#MAIN_IMAGES[@]} ))
  
  echo "📸 업데이트 중: $resort_id"
  echo "   → $IMAGE_URL"
  
  # 리조트 정보 가져오기
  RESORT_DATA=$(curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?id=$resort_id")
  
  # Check if success
  if ! echo "$RESORT_DATA" | jq -e '.success' > /dev/null 2>&1; then
    echo "   ⚠️  가져오기 실패"
    continue
  fi
  
  # Extract resort data and update main_image_url
  UPDATED=$(echo "$RESORT_DATA" | jq --arg img "$IMAGE_URL" '.data + {main_image_url: $img}')
  
  # PUT 요청으로 업데이트
  RESPONSE=$(curl -s -X PUT "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?id=$resort_id" \
    -H "Content-Type: application/json" \
    -d "$UPDATED")
  
  if echo "$RESPONSE" | jq -e '.success' > /dev/null 2>&1; then
    echo "   ✅ 완료"
    ((COUNT++))
  else
    echo "   ⚠️  실패: $(echo "$RESPONSE" | jq -r '.error // "Unknown error"')"
  fi
  
  # Rate limit 방지
  sleep 0.2
done

echo ""
echo "🎉 완료! 총 ${COUNT}개 리조트의 메인 이미지 업데이트됨"
echo ""
echo "📋 사용된 이미지: 10가지 다양한 리조트 테마"
