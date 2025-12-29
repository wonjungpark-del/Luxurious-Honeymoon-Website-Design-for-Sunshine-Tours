#!/bin/bash

BASE_URL="https://luxurious-honeymoon-website-design.vercel.app"

echo "========================================"
echo "후기 페이지 테스트"
echo "========================================"

# Test reviews list page
echo -e "\n1. 후기 목록 페이지 테스트 (/reviews)..."
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/reviews")
echo "Status: $STATUS"

# Test review write page
echo -e "\n2. 후기 작성 페이지 테스트 (/review-write)..."
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/review-write")
echo "Status: $STATUS"

# Test reviews API
echo -e "\n3. 후기 API 테스트 (/api/reviews)..."
curl -s "$BASE_URL/api/reviews" | head -20

echo -e "\n========================================"
echo "테스트 완료"
echo "========================================"
