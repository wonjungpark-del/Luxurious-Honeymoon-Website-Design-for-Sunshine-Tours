#!/bin/bash

upload_image() {
    local file="$1"
    local name=$(basename "$file")
    echo "Uploading $name..."
    result=$(curl -s -X POST "https://luxurious-honeymoon-website-design.vercel.app/api/upload" -F "image=@$file" 2>&1)
    url=$(echo "$result" | grep -o 'https://[^"]*' | head -1)
    if [ -n "$url" ]; then
        echo "$name|$url"
    else
        echo "$name|FAILED"
    fi
}

# Italy
cd italy
for img in rome-colosseum.jpg rome-trevi.jpg venice-canal.jpg venice-gondola.jpg florence-duomo.jpg milan-duomo.jpg; do
    [ -f "$img" ] && [ $(stat -f%z "$img" 2>/dev/null || stat -c%s "$img") -gt 10000 ] && upload_image "$img"
done

# Switzerland  
cd ../switzerland
for img in zurich-lake.jpg zurich-old-town.jpg lucerne-bridge.jpg interlaken-mountain.jpg interlaken-lake.jpg geneva-fountain.jpg; do
    [ -f "$img" ] && [ $(stat -f%z "$img" 2>/dev/null || stat -c%s "$img") -gt 10000 ] && upload_image "$img"
done

# Czech
cd ../czech
for img in prague-castle.jpg prague-bridge.jpg; do
    [ -f "$img" ] && [ $(stat -f%z "$img" 2>/dev/null || stat -c%s "$img") -gt 10000 ] && upload_image "$img"
done

# Austria
cd ../austria
for img in vienna-palace.jpg vienna-opera.jpg; do
    [ -f "$img" ] && [ $(stat -f%z "$img" 2>/dev/null || stat -c%s "$img") -gt 10000 ] && upload_image "$img"
done

# Croatia
cd ../croatia
for img in dubrovnik-old-town.jpg split-palace.jpg; do
    [ -f "$img" ] && [ $(stat -f%z "$img" 2>/dev/null || stat -c%s "$img") -gt 10000 ] && upload_image "$img"
done

# Turkey
cd ../turkey
for img in istanbul-mosque.jpg istanbul-bosphorus.jpg cappadocia-balloons.jpg cappadocia-rocks.jpg; do
    [ -f "$img" ] && [ $(stat -f%z "$img" 2>/dev/null || stat -c%s "$img") -gt 10000 ] && upload_image "$img"
done
