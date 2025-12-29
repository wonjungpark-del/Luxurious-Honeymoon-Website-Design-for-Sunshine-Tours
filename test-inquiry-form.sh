#!/bin/bash

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "========================================"
echo "문의하기 폼 테스트"
echo "========================================"

# 테스트 데이터 전송
echo -e "\n1. POST 요청 테스트..."
RESPONSE=$(curl -s -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "name": "홍길동",
    "phone": "010-1234-5678",
    "email": "test@example.com",
    "subject": "발리 허니문 문의",
    "destination": "발리",
    "budget": "500만원",
    "travelers": 2,
    "duration": "5박 7일",
    "message": "발리 허니문 상담 부탁드립니다."
  }' \
  "$BASE_URL/api/inquiries")

echo "응답: $RESPONSE"

if echo "$RESPONSE" | grep -q '"success":true'; then
  echo "✅ 문의 등록 성공!"
  
  # 등록된 문의 조회
  echo -e "\n2. 등록된 문의 조회..."
  curl -s "$BASE_URL/api/inquiries" | head -20
else
  echo "❌ 문의 등록 실패"
fi

echo -e "\n========================================"
echo "테스트 완료"
echo "========================================"
