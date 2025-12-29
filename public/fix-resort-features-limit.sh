#!/bin/bash

echo "🔧 리조트 특징 4개 제한 및 이미지 fallback 수정..."
echo ""

FILES=(
  "thailand-khao-lak.html"
  "thailand-phuket.html"
  "thailand-koh-samui.html"
  "thailand-krabi.html"
  "thailand-pattaya.html"
  "thailand-hua-hin.html"
  "maui.html"
  "bigisland.html"
  "oahu.html"
  "maldives.html"
  "mauritius.html"
)

for file in "${FILES[@]}"; do
  if [ -f "$file" ]; then
    echo "📝 수정 중: $file"
    
    # 1. Features를 4개로 제한 (slice(0, 4))
    # features.map → features.slice(0, 4).map
    sed -i 's/\${features\.map(feature =>/\${features.slice(0, 4).map(feature =>/g' "$file"
    
    # 2. 이미지 fallback 추가
    # <img src="${resort.main_image_url}" alt="${resort.name_ko}">
    # →
    # <img src="${resort.main_image_url || 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800'}" alt="${resort.name_ko}">
    sed -i 's|<img src="\${resort\.main_image_url}" alt="\${resort\.name_ko}">|<img src="\${resort.main_image_url || '"'"'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800'"'"'}" alt="\${resort.name_ko}" onerror="this.src='"'"'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800'"'"'">|g' "$file"
    
    echo "✅ 완료: $file"
  else
    echo "⚠️  파일 없음: $file"
  fi
done

echo ""
echo "🎉 모든 페이지 수정 완료!"
echo ""
echo "📋 변경 사항:"
echo "   1. 리조트 특징(features) 표시: 전체 → 최대 4개"
echo "   2. 이미지 fallback 추가: 메인 이미지 없을 경우 기본 이미지 표시"
