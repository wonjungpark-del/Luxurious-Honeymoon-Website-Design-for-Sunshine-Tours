# ☀️ 선샤인투어 - 프리미엄 허니문 & 해외 여행 전문

## 📋 프로젝트 개요

선샤인투어는 프리미엄 허니문 및 해외 여행을 전문으로 하는 여행사의 공식 홈페이지입니다. Cloudflare Pages와 Hono 프레임워크를 사용하여 구축된 현대적이고 빠른 웹 애플리케이션입니다.

### 주요 특징
- ✅ 지역별 리조트 정보 제공
- ✅ 고객 후기 시스템 (작성/조회/관리)
- ✅ 온라인 문의 시스템
- ✅ 관리자 대시보드
- ✅ 반응형 디자인 (Mobile/Tablet/Desktop)
- ✅ D1 데이터베이스 연동
- ✅ RESTful API

## 🚀 URL 정보

### ✨ 프로덕션 (Cloudflare Pages)
- **메인 페이지**: https://e6fde030.sunshinetour.pages.dev
- **태국 카오락**: https://e6fde030.sunshinetour.pages.dev/thailand-khao-lak
- **태국 코사무이**: https://e6fde030.sunshinetour.pages.dev/thailand-koh-samui
- **태국 푸켓**: https://e6fde030.sunshinetour.pages.dev/thailand-phuket
- **태국 끄라비**: https://e6fde030.sunshinetour.pages.dev/thailand-krabi
- **태국 파타야**: https://e6fde030.sunshinetour.pages.dev/thailand-pattaya
- **태국 후아힌**: https://e6fde030.sunshinetour.pages.dev/thailand-hua-hin
- **후기 목록**: https://e6fde030.sunshinetour.pages.dev/reviews
- **후기 작성**: https://e6fde030.sunshinetour.pages.dev/review-write
- **문의하기**: https://e6fde030.sunshinetour.pages.dev/inquiry
- **관리자 페이지**: https://e6fde030.sunshinetour.pages.dev/admin

### 개발 서버 (Sandbox)
- **메인 페이지**: https://3000-izlo14af8bw6i0urlswzu-5c13a017.sandbox.novita.ai
- **후기 목록**: https://3000-izlo14af8bw6i0urlswzu-5c13a017.sandbox.novita.ai/reviews
- **후기 작성**: https://3000-izlo14af8bw6i0urlswzu-5c13a017.sandbox.novita.ai/review-write
- **문의하기**: https://3000-izlo14af8bw6i0urlswzu-5c13a017.sandbox.novita.ai/inquiry
- **관리자 페이지**: https://3000-izlo14af8bw6i0urlswzu-5c13a017.sandbox.novita.ai/admin

### API 엔드포인트
- `GET /api/regions` - 지역 목록 조회
- `GET /api/resorts?region_id={id}` - 리조트 목록 조회
- `GET /api/reviews?status=approved` - 승인된 후기 조회
- `POST /api/reviews` - 후기 작성
- `GET /api/inquiries` - 문의 목록 조회
- `POST /api/inquiries` - 문의 작성

## 📊 데이터베이스 구조

### Tables

#### 1. regions (지역)
| 필드 | 타입 | 설명 |
|------|------|------|
| id | TEXT | 고유 ID |
| code | TEXT | 지역 코드 |
| country | TEXT | 국가 코드 |
| name_ko | TEXT | 지역명 (한글) |
| name_en | TEXT | 지역명 (영문) |
| description | TEXT | 설명 |
| image_url | TEXT | 대표 이미지 URL |
| display_order | INTEGER | 표시 순서 |
| is_active | BOOLEAN | 활성화 여부 |

#### 2. resorts (리조트)
| 필드 | 타입 | 설명 |
|------|------|------|
| id | TEXT | 고유 ID |
| region_id | TEXT | 지역 ID (FK) |
| name_ko | TEXT | 리조트명 (한글) |
| name_en | TEXT | 리조트명 (영문) |
| category | TEXT | 카테고리 |
| description | TEXT | 설명 |
| main_image_url | TEXT | 메인 이미지 URL |
| gallery_images | TEXT | 갤러리 이미지 (JSON) |
| features | TEXT | 특징 (JSON) |
| display_order | INTEGER | 표시 순서 |

#### 3. reviews (후기)
| 필드 | 타입 | 설명 |
|------|------|------|
| id | TEXT | 고유 ID |
| destination | TEXT | 여행지 코드 |
| destination_kr | TEXT | 여행지명 (한글) |
| title | TEXT | 제목 |
| content | TEXT | 내용 |
| rating | INTEGER | 별점 (1-5) |
| author_name | TEXT | 작성자명 |
| travel_date | TEXT | 여행 일자 |
| image_url | TEXT | 이미지 URL |
| status | TEXT | 상태 (pending/approved/rejected) |

#### 4. inquiries (문의)
| 필드 | 타입 | 설명 |
|------|------|------|
| id | TEXT | 고유 ID |
| name | TEXT | 이름 |
| email | TEXT | 이메일 |
| phone | TEXT | 전화번호 |
| destination | TEXT | 희망 여행지 |
| budget | TEXT | 예산 |
| travelers | INTEGER | 인원 |
| departure_date | TEXT | 출발 희망일 |
| duration | TEXT | 여행 기간 |
| subject | TEXT | 제목 |
| message | TEXT | 내용 |
| status | TEXT | 상태 (pending/processing/completed) |

## 💻 기술 스택

### Frontend
- HTML5, CSS3, JavaScript (Vanilla)
- Google Fonts (Montserrat, Noto Serif KR)
- Font Awesome 6.4.0
- 반응형 디자인

### Backend
- Hono 4.11.1 (Web Framework)
- Cloudflare Pages
- Cloudflare D1 (SQLite Database)

### Development Tools
- Vite 6.3.5 (Build Tool)
- Wrangler 4.4.0 (Cloudflare CLI)
- PM2 (Process Manager)
- Git

## 📁 프로젝트 구조

```
webapp/
├── src/
│   └── index.tsx              # Hono 백엔드 애플리케이션
├── public/                    # 정적 파일
│   ├── static/
│   │   ├── css/
│   │   │   ├── style.css      # 메인 스타일시트
│   │   │   └── admin.css      # 관리자 스타일
│   │   ├── js/
│   │   │   └── main.js        # 메인 JavaScript
│   │   └── images/            # 이미지 파일
│   ├── reviews.html           # 후기 목록
│   ├── review-write.html      # 후기 작성
│   ├── inquiry.html           # 문의하기
│   └── admin.html             # 관리자 페이지
├── migrations/                # 데이터베이스 마이그레이션
│   └── 0001_initial_schema.sql
├── seed.sql                   # 샘플 데이터
├── ecosystem.config.cjs       # PM2 설정
├── wrangler.jsonc             # Cloudflare 설정
├── package.json
└── README.md
```

## 🚀 로컬 개발 환경 설정

### 1. 의존성 설치
```bash
cd /home/user/webapp
npm install
```

### 2. 데이터베이스 초기화
```bash
# 데이터베이스 리셋 (스키마 + 샘플 데이터)
npm run db:reset

# 또는 수동으로
npm run db:migrate:local
npm run db:seed
```

### 3. 개발 서버 시작
```bash
# 빌드
npm run build

# PM2로 서버 시작
pm2 start ecosystem.config.cjs

# 서버 상태 확인
pm2 list

# 로그 확인
pm2 logs sunshinetour --nostream
```

### 4. 서버 테스트
```bash
# 메인 페이지 테스트
curl http://localhost:3000

# API 테스트
curl http://localhost:3000/api/regions
curl http://localhost:3000/api/reviews?status=approved
```

## 📝 주요 기능

### 1. 메인 페이지 (/)
- 히어로 섹션
- 회사 소개
- 인기 여행지 4개 표시
- 최신 승인된 후기 3개 표시
- 연락처 정보

### 2. 후기 시스템
- **후기 목록** (/reviews)
  - 승인된 후기만 표시
  - 여행지별 필터링
  - 별점별 필터링
  - 카드 형식 레이아웃
  
- **후기 작성** (/review-write)
  - 여행지 선택
  - 별점 선택 (1-5점)
  - 제목, 내용, 작성자, 여행 시기 입력
  - 이미지 URL (선택)
  - 제출 후 승인 대기 상태

### 3. 문의 시스템 (/inquiry)
- 이름, 연락처, 이메일 입력
- 희망 여행지 선택
- 예산, 인원, 출발일, 기간 선택
- 문의 제목 및 내용 작성
- 제출 후 관리자 확인

### 4. 관리자 페이지 (/admin)
- **로그인**: 비밀번호 `admin1234`
- **대시보드**
  - 전체 후기/문의 통계
  - 승인 대기 건수
- **후기 관리**
  - 상태별 필터링
  - 상세 보기
  - 승인/거부/삭제
- **문의 관리**
  - 상태별 필터링
  - 상세 보기
  - 상태 변경 (대기/처리중/완료)
  - 삭제

## 🎨 디자인 컨셉

### 컬러 스킴
- **Primary**: #C9A96E (골드)
- **Secondary**: #2C2C2C (다크 그레이)
- **Accent**: #7A7A7A (미디엄 그레이)
- **Background**: #FFFFFF (화이트)

### 폰트
- **영문 헤드라인**: Montserrat
- **한글 본문**: Noto Serif KR

### 디자인 스타일
- 럭셔리하고 프리미엄한 느낌
- 깔끔하고 모던한 레이아웃
- 이미지 중심의 비주얼

## 📱 반응형 디자인

- **Desktop**: 1200px 이상
- **Tablet**: 768px ~ 1199px
- **Mobile**: 767px 이하

## 🔧 개발 명령어

```bash
# 개발 서버 시작
npm run dev

# 프로덕션 빌드
npm run build

# PM2로 개발 서버 시작
pm2 start ecosystem.config.cjs

# PM2 상태 확인
pm2 list

# PM2 로그 확인
pm2 logs --nostream

# PM2 재시작
pm2 restart sunshinetour

# PM2 중지
pm2 stop sunshinetour

# 포트 정리
npm run clean-port

# 데이터베이스 리셋
npm run db:reset

# 데이터베이스 콘솔
npm run db:console:local

# Git 커밋
npm run git:commit "커밋 메시지"
```

## 📊 현재 구현 상태

### ✅ 완료된 기능
1. ✅ 프로젝트 환경 설정 (Hono + Cloudflare Pages)
2. ✅ D1 데이터베이스 스키마 설계 및 마이그레이션
3. ✅ Hono 백엔드 RESTful API 구축
4. ✅ 메인 페이지 (홈페이지)
5. ✅ 후기 시스템 (작성/목록/필터링)
6. ✅ 문의 시스템 (폼/제출)
7. ✅ 관리자 페이지 (대시보드/후기관리/문의관리)
8. ✅ 샘플 데이터 생성 및 시딩
9. ✅ **태국 6개 지역 페이지** (카오락, 코사무이, 푸켓, 끄라비, 파타야, 후아힌)
10. ✅ **Cloudflare Pages 프로덕션 배포 완료**
11. ✅ Git 버전 관리 및 커밋

### 🚧 진행 중인 작업
없음

### 📝 향후 개발 계획
1. **나머지 지역 페이지 개발** (발리, 몰디브, 보라카이, 하와이 등 30개 페이지)
2. **이미지 최적화** (Google Drive 이미지 다운로드 및 Cloudflare R2 업로드)
3. **리조트 상세 페이지** 개발 (각 리조트별 전용 페이지)
4. **검색 기능** (지역/리조트 통합 검색)
5. **페이지네이션** (후기/문의 목록)
6. **SEO 최적화** (메타 태그, 구조화 데이터)
7. **커스텀 도메인** 연결 (예: sunshinetour.co.kr)
8. **관리자 인증 강화** (JWT 토큰 기반 인증)

## 🔐 관리자 정보

- **관리자 비밀번호**: `admin1234`
- **관리자 페이지**: /admin

⚠️ **보안 주의**: 프로덕션 환경에서는 반드시 비밀번호를 변경하고, 더 강력한 인증 시스템을 도입해야 합니다.

## 📧 연락처

- **전화**: 02-1234-5678
- **이메일**: info@sunshinetour.com
- **주소**: 서울특별시 강남구

## 📄 라이선스

Copyright © 2024 선샤인투어. All rights reserved.

## 🚀 배포 가이드

### Cloudflare Pages 배포 (프로덕션)

#### 1. 빌드
```bash
cd /home/user/webapp
npm run build
```

#### 2. 배포
```bash
npx wrangler pages deploy dist --project-name sunshinetour --branch main
```

#### 3. 데이터베이스 마이그레이션 (최초 1회)
```bash
# 프로덕션 D1 데이터베이스에 스키마 적용
npx wrangler d1 migrations apply sunshinetour-db

# 샘플 데이터 삽입
npx wrangler d1 execute sunshinetour-db --file=./seed.sql
```

#### 4. 환경 변수 설정 (필요시)
```bash
npx wrangler pages secret put SECRET_KEY --project-name sunshinetour
```

### 데이터베이스 관리

```bash
# 로컬 데이터베이스 조회
npm run db:console:local

# 프로덕션 데이터베이스 조회
npm run db:console:prod

# 로컬 데이터베이스 리셋
npm run db:reset
```

## 📊 데이터베이스 정보

- **D1 Database ID**: `7646dcd9-9995-459e-9f14-ba3dea2c1832`
- **Database Name**: `sunshinetour-db`
- **Binding**: `DB`

### 현재 데이터 통계
- **지역**: 12개 (태국 6, 인도네시아 2, 필리핀 3, 몰디브 1)
- **리조트**: 9개 (태국 지역별 프리미엄 리조트)
- **후기**: 5개 (샘플 데이터)
- **문의**: 3개 (샘플 데이터)

---

**최종 업데이트**: 2024년 12월 16일  
**버전**: 1.0.0  
**개발 상태**: ✅ **프로덕션 배포 완료**  
**프로덕션 URL**: https://e6fde030.sunshinetour.pages.dev  
**Cloudflare Project**: sunshinetour  

---

## 🎉 배포 완료!

모든 페이지와 API가 정상적으로 작동합니다:
- ✅ 메인 페이지 (index.html)
- ✅ 태국 6개 지역 페이지
- ✅ 후기 시스템 (목록/작성)
- ✅ 문의 시스템
- ✅ 관리자 페이지
- ✅ RESTful API (regions, resorts, reviews, inquiries)
