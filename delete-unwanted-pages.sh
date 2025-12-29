#!/bin/bash
# 보라보라, 산토리니, 아말피 페이지 및 데이터 삭제

echo "============================================"
echo "페이지 및 데이터 삭제"
echo "============================================"
echo ""

# 1. HTML 페이지 삭제
echo "1. HTML 페이지 삭제 중..."
rm -f public/borabora.html
rm -f public/santorini.html
rm -f public/amalfi.html
echo "✅ 3개 HTML 페이지 삭제 완료"
echo ""

# 2. 생성 스크립트에서 해당 페이지 제거
echo "2. 생성 스크립트 확인..."
if [ -f "generate-new-destination-pages.py" ]; then
    echo "   - generate-new-destination-pages.py 파일 발견"
fi
if [ -f "regenerate-pages-khao-lak-style.py" ]; then
    echo "   - regenerate-pages-khao-lak-style.py 파일 발견 (다낭/피지만 포함)"
fi
echo ""

# 3. 삭제할 리조트 ID 목록
echo "3. 삭제 대상 확인..."
echo "   지역:"
echo "   - region-tahiti-borabora (보라보라)"
echo "   - region-greece-santorini (산토리니)"
echo "   - region-italy-amalfi (아말피)"
echo ""
echo "   리조트:"
echo "   - resort-borabora-stregis"
echo "   - resort-borabora-fourseasons"
echo "   - resort-borabora-intercontinental"
echo "   - resort-santorini-katikies"
echo "   - resort-santorini-canaves-oia"
echo "   - resort-santorini-mystique"
echo "   - resort-amalfi-monastero"
echo "   - resort-amalfi-belmond"
echo "   - resort-amalfi-mezzatorre"
echo ""

echo "============================================"
echo "⚠️  주의: DB 데이터는 Admin 페이지에서 수동 삭제 필요"
echo "============================================"
echo ""
echo "Admin 페이지: https://luxurious-honeymoon-website-design.vercel.app/admin"
echo ""
echo "삭제 순서:"
echo "1. 먼저 리조트 9개 삭제 (위 resort-* ID)"
echo "2. 그 다음 지역 3개 삭제 (위 region-* ID)"
echo ""

echo "✅ 로컬 파일 삭제 완료!"
