#!/bin/bash

# List of files to process
FILES=(
    "public/boracay.html"
    "public/cebu-bohol.html"
    "public/palawan.html"
    "public/oahu.html"
    "public/maui.html"
    "public/bigisland.html"
    "public/fiji.html"
    "public/danang.html"
    "public/mauritius.html"
    "public/cebu.html"
)

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "Processing $file..."
        # Remove the resort-cta button line
        sed -i '/<a href="\/inquiry" class="resort-cta">/d' "$file"
        sed -i '/class="resort-cta">상담 신청하기<\/a>/d' "$file"
        sed -i '/class="resort-cta">문의하기<\/a>/d' "$file"
        echo "✓ Updated $file"
    else
        echo "✗ File not found: $file"
    fi
done

echo ""
echo "Done! Removed resort-cta buttons from all files."
