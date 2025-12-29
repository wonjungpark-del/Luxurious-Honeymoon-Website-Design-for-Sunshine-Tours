import re
import os

# 수정할 파일 목록
files = [
    'public/thailand-phuket.html',
    'public/thailand-koh-samui.html', 
    'public/thailand-pattaya.html',
    'public/bali-resorts.html',
    'public/lombok-resorts.html'
]

# 검색 패턴 (하드코딩된 설명과 특징)
old_pattern = r'''<p class="resort-description"[^>]*>
\s+\$\{resort\.name_ko\}은\(는\) [^<]+의 프리미엄 허니문 리조트입니다\.<br>
\s+[^<]+<br>
\s+[^<]+<br>
\s+[^<]+
\s+</p>
\s+<div class="resort-features">
\s+<div class="feature-item">
\s+<i class="fas fa-check-circle"[^>]*></i>
\s+<span>[^<]+</span>
\s+</div>
\s+<div class="feature-item">
\s+<i class="fas fa-check-circle"[^>]*></i>
\s+<span>[^<]+</span>
\s+</div>
\s+<div class="feature-item">
\s+<i class="fas fa-check-circle"[^>]*></i>
\s+<span>[^<]+</span>
\s+</div>
\s+<div class="feature-item">
\s+<i class="fas fa-check-circle"[^>]*></i>
\s+<span>[^<]+</span>
\s+</div>
\s+</div>'''

# 새로운 코드 (API 데이터 사용)
new_code = '''<p class="resort-description" style="line-height: 1.8; margin-bottom: 1.5rem; color: #666;">
                                                ${resort.description || `${resort.name_ko}은(는) 프리미엄 허니문 리조트입니다.`}
                                            </p>
                                            ${features.length > 0 ? `
                                            <div class="resort-features">
                                                ${features.slice(0, 4).map(feature => `
                                                    <div class="feature-item">
                                                        <i class="fas fa-check-circle" style="color: #C9A96E;"></i>
                                                        <span>${feature}</span>
                                                    </div>
                                                `).join('')}
                                            </div>
                                            ` : ''}'''

for file_path in files:
    if not os.path.exists(file_path):
        print(f"⏭️  파일 없음: {file_path}")
        continue
    
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 패턴 매치 확인
        if re.search(old_pattern, content, re.MULTILINE):
            # 교체
            new_content = re.sub(old_pattern, new_code, content, flags=re.MULTILINE)
            
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            
            print(f"✅ 수정 완료: {file_path}")
        else:
            print(f"⚠️  패턴 못찾음: {file_path}")
    except Exception as e:
        print(f"❌ 오류: {file_path} - {str(e)}")

print("\n모든 페이지 수정 완료!")
