#!/bin/bash

echo "🖼️  모든 리조트에 샘플 갤러리 이미지 6개 추가..."
echo ""

# Unsplash 샘플 이미지 (리조트/호텔 테마)
SAMPLE_IMAGES=(
  "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800"  # 리조트 수영장
  "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800"  # 리조트 객실
  "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800"  # 비치 전망
  "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800"  # 리조트 외관
  "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800"  # 레스토랑
  "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800"  # 스파/웰니스
)

# JSON 배열 생성
GALLERY_JSON=$(printf '%s\n' "${SAMPLE_IMAGES[@]}" | jq -R . | jq -s .)

echo "📋 추가할 갤러리 이미지:"
echo "$GALLERY_JSON" | jq -r '.[] | "   - " + .'
echo ""

# 모든 리조트 ID 가져오기
echo "🔍 갤러리 이미지가 없는 리조트 검색 중..."
RESORTS=$(curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts" | jq -r '.data[] | select(.gallery_images | length == 0) | .id')

COUNT=0
for resort_id in $RESORTS; do
  echo "📸 업데이트 중: $resort_id"
  
  # 리조트 정보 가져오기
  RESORT_DATA=$(curl -s "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?id=$resort_id" | jq '.data[0]')
  
  # gallery_images 업데이트
  UPDATED_DATA=$(echo "$RESORT_DATA" | jq --argjson gallery "$GALLERY_JSON" '. + {gallery_images: $gallery}')
  
  # PUT 요청으로 업데이트
  RESPONSE=$(curl -s -X PUT "https://luxurious-honeymoon-website-design.vercel.app/api/resorts?id=$resort_id" \
    -H "Content-Type: application/json" \
    -d "$UPDATED_DATA")
  
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
echo "🎉 완료! 총 ${COUNT}개 리조트에 갤러리 이미지 추가됨"
