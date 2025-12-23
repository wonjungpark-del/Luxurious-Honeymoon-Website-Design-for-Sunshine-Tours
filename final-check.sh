#!/bin/bash

echo "=========================================="
echo "FINAL SYSTEM CHECK"
echo "=========================================="
echo ""

# 1. Database Check
echo "1. DATABASE STATUS:"
echo "   Regions: $(npx wrangler d1 execute sunshinetour-db --local --command='SELECT COUNT(*) as count FROM regions' 2>/dev/null | grep -o '"count":[0-9]*' | grep -o '[0-9]*')"
echo "   Resorts: $(npx wrangler d1 execute sunshinetour-db --local --command='SELECT COUNT(*) as count FROM resorts' 2>/dev/null | grep -o '"count":[0-9]*' | grep -o '[0-9]*')"
echo ""

# 2. Files Check
echo "2. HTML PAGES:"
cd /home/user/webapp/dist
echo "   Total HTML files: $(ls -1 *.html 2>/dev/null | wc -l)"
echo "   Resort pages: $(ls -1 *.html 2>/dev/null | grep -E '(oahu|maui|bigisland|maldives|cancun|mauritius|danang|boracay|cebu|palawan|fiji|guam|saipan|australia|paris|rome|spain|switzerland|prague|vienna|croatia|turkey)\.html' | wc -l)"
echo ""

# 3. API Check
echo "3. API ENDPOINTS:"
echo "   /api/regions: $(curl -s http://localhost:3000/api/regions | grep -o '"success":true' | wc -l) (1 = OK)"
echo "   /api/resorts: $(curl -s http://localhost:3000/api/resorts | grep -o '"success":true' | wc -l) (1 = OK)"
echo "   /api/reviews: $(curl -s http://localhost:3000/api/reviews | grep -o '"success":true' | wc -l) (1 = OK)"
echo ""

# 4. Sample Resort Data
echo "4. SAMPLE RESORT DATA:"
echo "   Oahu: $(curl -s 'http://localhost:3000/api/resorts?region_id=region-oahu' | python3 -c 'import sys,json;print(len(json.load(sys.stdin)["data"]))' 2>/dev/null || echo '0')"
echo "   Maldives: $(curl -s 'http://localhost:3000/api/resorts?region_id=region-maldives' | python3 -c 'import sys,json;print(len(json.load(sys.stdin)["data"]))' 2>/dev/null || echo '0')"
echo "   Boracay: $(curl -s 'http://localhost:3000/api/resorts?region_id=region-boracay' | python3 -c 'import sys,json;print(len(json.load(sys.stdin)["data"]))' 2>/dev/null || echo '0')"
echo "   Paris: $(curl -s 'http://localhost:3000/api/resorts?region_id=region-paris' | python3 -c 'import sys,json;print(len(json.load(sys.stdin)["data"]))' 2>/dev/null || echo '0')"
echo ""

# 5. Service Status
echo "5. SERVICE STATUS:"
pm2 list | grep sunshinetour
echo ""

echo "=========================================="
echo "CHECK COMPLETE"
echo "=========================================="
