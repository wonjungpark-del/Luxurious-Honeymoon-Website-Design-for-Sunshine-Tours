// 선샤인투어 메인 JavaScript

// API 기본 URL
const API_BASE = '/api';

// 모바일 메뉴 토글
document.addEventListener('DOMContentLoaded', () => {
  const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
  const navLinks = document.querySelector('.nav-links');
  
  if (mobileMenuBtn) {
    mobileMenuBtn.addEventListener('click', () => {
      navLinks.classList.toggle('active');
    });
  }
  
  // 메인 페이지에서 후기 로드
  if (document.getElementById('reviews-container')) {
    loadFeaturedReviews();
  }
});

// 승인된 후기 중 최신 3개 로드
async function loadFeaturedReviews() {
  const container = document.getElementById('reviews-container');
  
  try {
    const response = await fetch(`${API_BASE}/reviews?status=approved`);
    const result = await response.json();
    
    if (result.success && result.data.length > 0) {
      // 최신 3개만 선택
      const reviews = result.data.slice(0, 3);
      
      container.innerHTML = `
        <div class="card-grid">
          ${reviews.map(review => createReviewCard(review)).join('')}
        </div>
      `;
    } else {
      container.innerHTML = `
        <div style="text-align: center; padding: 3rem; color: var(--text-light);">
          <p>아직 등록된 후기가 없습니다.</p>
        </div>
      `;
    }
  } catch (error) {
    console.error('Error loading reviews:', error);
    container.innerHTML = `
      <div class="error-message">
        후기를 불러오는 중 오류가 발생했습니다.
      </div>
    `;
  }
}

// 후기 카드 생성
function createReviewCard(review) {
  const stars = '⭐'.repeat(review.rating);
  const imageHtml = review.image_url 
    ? `<img src="${review.image_url}" alt="${review.title}" class="card-image" onerror="this.style.display='none'">` 
    : '';
  
  return `
    <div class="card">
      ${imageHtml}
      <div class="card-content">
        <div class="review-rating">${stars}</div>
        <h3 class="card-title">${escapeHtml(review.title)}</h3>
        <p class="card-description">${escapeHtml(review.content.substring(0, 100))}...</p>
        <div class="review-meta">
          <span><i class="fas fa-user"></i> ${escapeHtml(review.author_name)}</span>
          <span><i class="fas fa-calendar"></i> ${escapeHtml(review.travel_date)}</span>
        </div>
      </div>
    </div>
  `;
}

// HTML 이스케이프 함수
function escapeHtml(text) {
  const map = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#039;'
  };
  return text.replace(/[&<>"']/g, m => map[m]);
}

// 날짜 포맷 함수
function formatDate(timestamp) {
  const date = new Date(timestamp);
  return date.toLocaleDateString('ko-KR', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  });
}

// 로딩 스피너 표시
function showLoading(containerId) {
  const container = document.getElementById(containerId);
  if (container) {
    container.innerHTML = `
      <div class="loading">
        <div class="spinner"></div>
        <p>데이터를 불러오는 중...</p>
      </div>
    `;
  }
}

// 에러 메시지 표시
function showError(containerId, message) {
  const container = document.getElementById(containerId);
  if (container) {
    container.innerHTML = `
      <div class="error-message">
        ${message}
      </div>
    `;
  }
}

// 성공 메시지 표시
function showSuccess(containerId, message) {
  const container = document.getElementById(containerId);
  if (container) {
    container.innerHTML = `
      <div class="success-message">
        ${message}
      </div>
    `;
  }
}

// 스크롤 애니메이션
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.style.opacity = '1';
      entry.target.style.transform = 'translateY(0)';
    }
  });
}, observerOptions);

// 애니메이션 적용할 요소들
document.addEventListener('DOMContentLoaded', () => {
  const elements = document.querySelectorAll('.card, .resort-card, .review-card');
  elements.forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(20px)';
    el.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
    observer.observe(el);
  });
});
