#!/bin/bash

echo "📄 모든 지역 페이지 생성 중..."
echo ""

TEMPLATE="/home/user/webapp/public/thailand-khao-lak.html"

# Array of regions with their details
# Format: filename|region_id|title_ko|title_en|description
declare -a REGIONS=(
  "cancun.html|region-cancun|칸쿤|Cancun|카리브해의 럭셔리와 마야 문명"
  "boracay.html|region-philippines-boracay|보라카이|Boracay|화이트비치의 천국"
  "cebu.html|region-philippines-cebu|세부/보홀|Cebu|다이빙과 초콜릿 힐스"
  "palawan.html|region-philippines-palawan|팔라완|Palawan|세계에서 가장 아름다운 섬"
  "maldives.html|region-maldives|몰디브|Maldives|1섬 1리조트 프라이빗 럭셔리"
  "mauritius.html|region-mauritius|모리셔스|Mauritius|인도양의 낙원"
)

for region in "${REGIONS[@]}"; do
  IFS='|' read -ra PARTS <<< "$region"
  FILENAME="${PARTS[0]}"
  REGION_ID="${PARTS[1]}"
  TITLE_KO="${PARTS[2]}"
  TITLE_EN="${PARTS[3]}"
  DESC="${PARTS[4]}"
  
  echo "생성 중: $FILENAME ($TITLE_KO)"
  
  # Copy template
  cp "$TEMPLATE" "/home/user/webapp/public/$FILENAME"
  
  # Replace content
  FILE="/home/user/webapp/public/$FILENAME"
  
  # Update region ID
  sed -i "s/region-thailand-khao-lak/$REGION_ID/g" "$FILE"
  
  # Update titles
  sed -i "s/태국 카오락 리조트 추천.*/$TITLE_KO 리조트 추천 | $DESC - 선샤인투어/g" "$FILE"
  sed -i "s/카오락/$TITLE_KO/g" "$FILE"
  sed -i "s/Khao Lak/$TITLE_EN/g" "$FILE"
  
  # Update breadcrumb
  if [[ $REGION_ID == *"philippines"* ]]; then
    sed -i 's/>태국</>필리핀</g' "$FILE"
  elif [[ $REGION_ID == *"cancun"* ]]; then
    sed -i 's/>태국</>멕시코</g' "$FILE"
  elif [[ $REGION_ID == *"maldives"* ]]; then
    sed -i 's/>태국</>몰디브</g' "$FILE"
  elif [[ $REGION_ID == *"mauritius"* ]]; then
    sed -i 's/>태국</>모리셔스</g' "$FILE"
  fi
  
  echo "✅ $FILENAME 생성 완료"
done

echo ""
echo "================================================"
echo "🎉 모든 페이지 생성 완료!"
echo "================================================"
echo ""
echo "생성된 페이지:"
echo "  • cancun.html"
echo "  • boracay.html"
echo "  • cebu.html"
echo "  • palawan.html"
echo "  • maldives.html"
echo "  • mauritius.html"
echo "================================================"
