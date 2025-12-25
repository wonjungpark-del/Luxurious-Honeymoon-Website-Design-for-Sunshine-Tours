# 🚀 Cloudflare Pages GitHub 연동 완벽 가이드

## 📋 현재 상황

✅ **완료됨:**
- GitHub 저장소: https://github.com/wonjungpark-del/Luxurious-Honeymoon-Website-Design-for-Sunshine-Tours
- 최신 코드 푸시 완료 (커밋: b22298f)
- 깨끗한 코드 구조 (30개 파일 정리)
- 모든 기능 정상 작동

⏳ **남은 작업:**
- Cloudflare Pages와 GitHub 저장소 연동

---

## 🎯 연동 설정 방법 (5분 소요)

### 방법 1: Cloudflare 대시보드에서 직접 연동 (추천) ⭐

#### 1단계: Cloudflare 대시보드 접속
```
👉 https://dash.cloudflare.com/08b77a99355140d28a61a0f45b4e5ca2/pages/view/sunshinetour
```

#### 2단계: Settings 탭 클릭
- 화면 상단의 **"Settings"** 탭을 클릭

#### 3단계: Builds & deployments
- 왼쪽 메뉴에서 **"Builds & deployments"** 클릭

#### 4단계: Connect to Git
- **"Source"** 섹션 찾기
- **"Connect to Git"** 또는 **"Connect account"** 버튼 클릭

#### 5단계: GitHub 연결
1. **GitHub 계정 선택**: wonjungpark-del
2. **권한 승인**: Cloudflare Pages 앱 설치 허용
3. **저장소 선택**: 
   ```
   Luxurious-Honeymoon-Website-Design-for-Sunshine-Tours
   ```

#### 6단계: 빌드 설정

```yaml
┌──────────────────────────────────────────────┐
│ Production branch:    main                   │
│ Framework preset:     None (또는 Vite)        │
│ Build command:        npm run build          │
│ Build output dir:     dist                   │
│ Root directory:       / (기본값, 비워둠)       │
└──────────────────────────────────────────────┘
```

**정확히 입력하세요:**
- Build command: `npm run build`
- Build output directory: `dist`

#### 7단계: Environment Variables (선택사항)
```
NODE_VERSION = 18
```

#### 8단계: Save and Deploy
- **"Save and Deploy"** 버튼 클릭
- 자동 빌드 시작! (3-5분 소요)

---

## ✅ 연동 완료 후 동작 방식

### 🔄 자동 배포 플로우:

```
개발 워크플로우:
───────────────────────────────────────────

1. 로컬에서 코드 수정
   ↓
2. git add . && git commit -m "변경 내용"
   ↓
3. git push origin main
   ↓ (GitHub 자동 감지)
   ↓
4. Cloudflare Pages 빌드 시작
   - npm install (의존성 설치)
   - npm run build (빌드)
   ↓ (3-5분 대기)
   ↓
5. 배포 완료! ✅
   ↓
6. https://sunshinetour.pages.dev 자동 업데이트
```

---

## 🔍 배포 확인 방법

### 1. Cloudflare Pages 대시보드
```
👉 https://dash.cloudflare.com/08b77a99355140d28a61a0f45b4e5ca2/pages/view/sunshinetour
```

**Deployments 탭에서 확인:**
- 🔄 Building... (빌드 중)
- ✅ Success (성공)
- ❌ Failed (실패)

### 2. 빌드 로그 확인
클릭하면 실시간 로그 확인:
```
[INFO] Installing dependencies...
[INFO] Running npm install
[INFO] Running build command: npm run build
[INFO] Build succeeded!
[INFO] Deploying to Cloudflare Pages...
[INFO] Deployment complete!
```

### 3. 배포 URL 확인
```
Production: https://sunshinetour.pages.dev
Preview: https://[commit-hash].sunshinetour.pages.dev
```

---

## 🎬 첫 배포 후 테스트

### 확인 항목:
```bash
# 1. 메인 페이지
https://sunshinetour.pages.dev

# 2. 히어로 이미지 (새 이미지 적용 확인)
https://sunshinetour.pages.dev/hero-honeymoon.webp

# 3. API 엔드포인트
https://sunshinetour.pages.dev/api/regions
https://sunshinetour.pages.dev/api/resorts

# 4. 후기 페이지
https://sunshinetour.pages.dev/reviews

# 5. 문의 페이지
https://sunshinetour.pages.dev/inquiry
```

---

## 🎯 예상 결과

### ✅ 연동 성공 시:

**동기화 완료:**
- ✅ 로컬 = GitHub = Cloudflare Pages (모두 동일)
- ✅ 최신 히어로 이미지 (허니문 커플)
- ✅ WebP 최적화 적용
- ✅ 깨끗한 코드 구조
- ✅ 모든 API 정상 작동

**자동화:**
- ✅ git push → 자동 배포
- ✅ 3-5분 후 LIVE
- ✅ 배포 히스토리 관리
- ✅ 쉬운 롤백

---

## ⚠️ 문제 해결

### 1. 빌드 실패 시

**로그에서 확인:**
```
[ERROR] npm install failed
→ package.json 확인

[ERROR] npm run build failed
→ vite.config.ts 확인

[ERROR] dist directory not found
→ Build output directory 설정 확인
```

**해결 방법:**
1. 로컬에서 `npm run build` 테스트
2. dist/ 폴더 생성 확인
3. Cloudflare 설정 재확인

### 2. API 작동 안 함

**확인 사항:**
- D1 데이터베이스 바인딩
- wrangler.jsonc 설정
- Environment variables

### 3. 이미지 로딩 실패

**확인:**
- R2 버킷 공개 URL 설정
- CORS 설정
- 이미지 경로

---

## 💡 추가 팁

### 커스텀 도메인 연결
```bash
# Cloudflare Pages → Settings → Custom domains
npx wrangler pages domain add yourdomain.com --project-name sunshinetour
```

### 환경 변수 추가
```
Settings → Environment variables

Production:
  API_KEY=your-production-key
  
Preview:
  API_KEY=your-preview-key
```

### 배포 알림 설정
```
Settings → Notifications
→ Deployment notifications
→ Email/Slack/Discord 연동
```

---

## 📊 배포 히스토리 예시

```
Deployments:
─────────────────────────────────────────────
✅ b22298f  Cleanup: Remove unnecessary files     (5분 전)
✅ 3844a17  Deploy: Update to latest UI           (1시간 전)
✅ 637c272  Update: Latest UI with hero image     (2시간 전)
```

---

## 🔗 중요 링크 모음

**GitHub:**
- 저장소: https://github.com/wonjungpark-del/Luxurious-Honeymoon-Website-Design-for-Sunshine-Tours

**Cloudflare:**
- 대시보드: https://dash.cloudflare.com/08b77a99355140d28a61a0f45b4e5ca2/pages/view/sunshinetour
- 프로덕션: https://sunshinetour.pages.dev

**로컬:**
- 개발 서버: http://localhost:3000

---

## 🎉 완료 체크리스트

연동 완료 후 확인:

- [ ] Cloudflare Pages → Deployments에 새 배포 표시
- [ ] 빌드 성공 (✅ Success)
- [ ] https://sunshinetour.pages.dev 접속 가능
- [ ] 메인 페이지 로딩 정상
- [ ] 히어로 이미지 (허니문 커플) 표시
- [ ] 지역 목록 API 작동
- [ ] 후기 시스템 작동
- [ ] 문의 폼 작동

모두 체크되면 완료! 🎉

---

## 📞 추가 도움이 필요하면

1. Cloudflare 커뮤니티: https://community.cloudflare.com/
2. Cloudflare Docs: https://developers.cloudflare.com/pages/
3. GitHub Issues: 프로젝트 저장소에 이슈 등록

---

**설정 가이드 작성일**: 2025-12-25
**프로젝트**: SunshineTour
**상태**: 배포 준비 완료 ✅

