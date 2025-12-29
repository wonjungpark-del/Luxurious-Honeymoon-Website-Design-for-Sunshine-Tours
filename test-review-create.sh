#!/bin/bash

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "========================================"
echo "후기 작성 API 테스트"
echo "========================================"

# 테스트 데이터 전송
echo -e "\n1. POST 요청 테스트..."
RESPONSE=$(curl -s -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "destination": "bali",
    "destination_kr": "발리",
    "title": "테스트 후기",
    "content": "테스트 후기 내용입니다.",
    "rating": 5,
    "author_name": "테스터",
    "travel_date": "2025-01",
    "image_url": null,
    "status": "pending",
    "is_featured": false
  }' \
  "$BASE_URL/api/reviews")

echo "응답: $RESPONSE"

if echo "$RESPONSE" | grep -q '"success":true'; then
  echo "✅ 후기 등록 성공!"
else
  echo "❌ 후기 등록 실패"
fi

echo -e "\n========================================"
echo "테스트 완료"
echo "========================================"
