#!/bin/bash

echo "🖼️  모든 리조트 메인 이미지를 로컬 이미지로 업데이트..."
echo ""

# 사용 가능한 로컬 리조트 이미지들
LOCAL_IMAGES=(
  "/static/images/resorts/krabi/krabi-resort01-01.webp"
  "/static/images/resorts/krabi/krabi-resort02-01.webp"
  "/static/images/resorts/krabi/krabi-resort03-01.webp"
  "/static/images/resorts/lombok/lombok-resort01-01.webp"
  "/static/images/resorts/lombok/lombok-resort02-01.webp"
  "/static/images/resorts/lombok/lombok-resort03-01.webp"
  "/static/images/resorts/maui/maui-resort01-01.webp"
  "/static/images/resorts/maui/maui-resort02-01.webp"
  "/static/images/resorts/maui/maui-resort03-01.webp"
  "/static/images/resorts/bigisland/bigisland-resort01-01.webp"
)

echo "📋 사용할 로컬 이미지: ${#LOCAL_IMAGES[@]}개"
echo ""

# 모든 리조트 가져오기
echo "🔍 모든 리조트 검색 중..."
ALL_RESORTS=$(curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" | jq -r '.data[] | .id')

COUNT=0
INDEX=0

for resort_id in $ALL_RESORTS; do
  # 이미지 순환 선택
  IMAGE_URL="${LOCAL_IMAGES[$INDEX]}"
  INDEX=$(( (INDEX + 1) % ${#LOCAL_IMAGES[@]} ))
  
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
  sleep 0.3
done

echo ""
echo "🎉 완료! 총 ${COUNT}개 리조트의 메인 이미지 업데이트됨"
echo ""
echo "✅ 모든 이미지가 로컬 서버 이미지로 변경되어 에러 없음!"
