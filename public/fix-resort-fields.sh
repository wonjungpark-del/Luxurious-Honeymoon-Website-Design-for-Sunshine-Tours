#!/bin/bash

FILES=(
  "thailand-phuket.html"
  "thailand-koh-samui.html"
  "thailand-krabi.html"
  "thailand-pattaya.html"
  "thailand-hua-hin.html"
  "maui.html"
  "bigisland.html"
  "oahu.html"
)

for file in "${FILES[@]}"; do
  if [ -f "$file" ]; then
    echo "📝 수정 중: $file"
    
    # Fix: JSON.parse() removal
    sed -i 's/features = resort\.features ? JSON\.parse(resort\.features) : \[\]/features = Array.isArray(resort.features) ? resort.features : []/g' "$file"
    sed -i 's/gallery = resort\.gallery_images ? JSON\.parse(resort\.gallery_images) : \[\]/gallery = Array.isArray(resort.gallery_images) ? resort.gallery_images : []/g' "$file"
    
    # Fix: name_kr -> name_ko
    sed -i 's/resort\.name_kr/resort.name_ko/g' "$file"
    
    # Fix: description_kr -> description
    sed -i 's/resort\.description_kr || resort\.description/resort.description/g' "$file"
    sed -i 's/resort\.description_kr/resort.description/g' "$file"
    
    echo "✅ 완료: $file"
  else
    echo "⚠️  파일 없음: $file"
  fi
done

echo ""
echo "🎉 모든 페이지 수정 완료!"
