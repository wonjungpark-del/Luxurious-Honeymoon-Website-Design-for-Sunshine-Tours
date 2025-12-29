#!/bin/bash

# Bali page
echo "=== Fixing Bali page ==="

# 1. Find and replace the resorts container div
sed -i 's/<div id="resortsContainer">/<div id="resorts-container" data-region="region-indonesia-bali">/' /home/user/webapp/public/bali.html

# 2. Replace the entire JavaScript section
# Find line number where script starts
START_LINE=$(grep -n "// Resort data from mapping file" /home/user/webapp/public/bali.html | cut -d: -f1)
END_LINE=$(grep -n "renderResorts();" /home/user/webapp/public/bali.html | tail -1 | cut -d: -f1)

if [ -n "$START_LINE" ] && [ -n "$END_LINE" ]; then
    echo "Replacing JavaScript from line $START_LINE to $END_LINE"
    
    # Create temp file with new JavaScript
    cat > /tmp/bali-new-js.txt << 'JSEOF'
        // Region ID
        const REGION_ID = 'region-indonesia-bali';
        
        async function loadResorts() {
            try {
                const response = await fetch(`/api/resorts?region_id=${REGION_ID}&is_active=true`);
                const result = await response.json();
                
                const container = document.getElementById('resorts-container');
                
                if (result.success && result.data.length > 0) {
                    const resorts = result.data;
                    
                    container.innerHTML = resorts.map(resort => {
                        // API already returns arrays, no need to parse
                        const features = Array.isArray(resort.features) ? resort.features : [];
                        const gallery = Array.isArray(resort.gallery_images) ? resort.gallery_images : [];
                        
                        // Category badge
                        const categoryLabels = {
                            'luxury': '럭셔리',
                            'premium': '프리미엄',
                            'standard': '스탠다드'
                        };
                        
                        const fallbackImg = 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=2080';
                        
                        return `
                            <div class="resort-card">
                                <div class="resort-content-wrapper">
                                    <div class="resort-header">
                                        <div class="resort-image">
                                            <img src="${resort.main_image_url || fallbackImg}" 
                                                 alt="${resort.name_ko}"
                                                 onerror="this.src='${fallbackImg}'">
                                            ${resort.category ? `<div class="resort-badge">${categoryLabels[resort.category] || resort.category}</div>` : ''}
                                        </div>
                                        <div class="resort-info">
                                            <div class="resort-category">${categoryLabels[resort.category] || 'RESORT'}</div>
                                            <h2 class="resort-name">${resort.name_ko}</h2>
                                            <p class="resort-description">${resort.description || ''}</p>
                                            ${features.length > 0 ? `
                                                <div class="resort-features">
                                                    ${features.slice(0, 4).map(feature => `
                                                        <div class="feature-item">
                                                            <i class="fas fa-check-circle"></i>
                                                            <span>${feature}</span>
                                                        </div>
                                                    `).join('')}
                                                </div>
                                            ` : ''}
                                            <a href="/inquiry" class="resort-cta">상담 신청하기</a>
                                        </div>
                                    </div>
                                    ${gallery.length > 0 ? `
                                        <div class="resort-gallery">
                                            ${gallery.slice(0, 6).map((img, index) => `
                                                <div class="gallery-item" onclick="openLightbox('${img}', '${resort.name_ko} - 이미지 ${index + 1}')">
                                                    <img src="${img}" alt="${resort.name_ko} - 이미지 ${index + 1}"
                                                         onerror="this.src='${fallbackImg}'">
                                                    <div class="gallery-overlay">
                                                        <i class="fas fa-search-plus"></i>
                                                    </div>
                                                </div>
                                            `).join('')}
                                        </div>
                                    ` : ''}
                                </div>
                            </div>
                        `;
                    }).join('');
                } else {
                    container.innerHTML = `
                        <div class="no-resorts">
                            <i class="fas fa-hotel"></i>
                            <p>현재 등록된 리조트가 없습니다.<br>곧 멋진 리조트들을 소개해드리겠습니다.</p>
                        </div>
                    `;
                }
            } catch (error) {
                console.error('Error loading resorts:', error);
                document.getElementById('resorts-container').innerHTML = `
                    <div class="error-resorts">
                        <i class="fas fa-exclamation-circle"></i>
                        <p>리조트 정보를 불러오는데 실패했습니다.<br>잠시 후 다시 시도해주세요.</p>
                    </div>
                `;
            }
        }
        
        // Lightbox functionality
        let currentModalImages = [];
        let currentImageIndex = 0;
        
        function openLightbox(imgSrc, caption) {
            // Find resort gallery images for navigation
            const galleries = document.querySelectorAll('.resort-gallery .gallery-item img');
            currentModalImages = Array.from(galleries).map(img => img.src);
            currentImageIndex = currentModalImages.indexOf(imgSrc);
            
            showModalImage(currentImageIndex);
            
            const modal = document.getElementById('imageModal');
            if (modal) {
                modal.style.display = 'flex';
            }
        }
        
        function closeModal() {
            const modal = document.getElementById('imageModal');
            if (modal) {
                modal.style.display = 'none';
            }
        }
        
        function changeModalImage(direction) {
            currentImageIndex += direction;
            if (currentImageIndex >= currentModalImages.length) {
                currentImageIndex = 0;
            } else if (currentImageIndex < 0) {
                currentImageIndex = currentModalImages.length - 1;
            }
            showModalImage(currentImageIndex);
        }
        
        function showModalImage(index) {
            const modalImg = document.getElementById('modalImage');
            const currentIndexEl = document.getElementById('currentImageIndex');
            const totalImagesEl = document.getElementById('totalImages');
            
            if (modalImg && currentModalImages.length > 0) {
                modalImg.src = currentModalImages[index];
                if (currentIndexEl) currentIndexEl.textContent = index + 1;
                if (totalImagesEl) totalImagesEl.textContent = currentModalImages.length;
            }
        }
        
        // Event listeners
        document.addEventListener('DOMContentLoaded', () => {
            // Load resorts
            loadResorts();
            
            // Close modal on background click
            const modal = document.getElementById('imageModal');
            if (modal) {
                modal.addEventListener('click', (e) => {
                    if (e.target === modal) {
                        closeModal();
                    }
                });
            }
            
            // Keyboard navigation
            document.addEventListener('keydown', (e) => {
                const modal = document.getElementById('imageModal');
                if (modal && modal.style.display === 'flex') {
                    if (e.key === 'Escape') {
                        closeModal();
                    } else if (e.key === 'ArrowLeft') {
                        changeModalImage(-1);
                    } else if (e.key === 'ArrowRight') {
                        changeModalImage(1);
                    }
                }
            });
        });
JSEOF

    # Use sed to replace the lines
    sed -i "${START_LINE},${END_LINE}d" /home/user/webapp/public/bali.html
    sed -i "${START_LINE}r /tmp/bali-new-js.txt" /home/user/webapp/public/bali.html
    echo "✅ Bali page JavaScript updated"
else
    echo "⚠️ Could not find JavaScript section in bali.html"
fi

echo ""
echo "=== Fixing Lombok page ==="

# Now do the same for Lombok page
sed -i 's/<div id="resortsContainer">/<div id="resorts-container" data-region="region-indonesia-lombok">/' /home/user/webapp/public/lombok.html

# Check if lombok.html has the same structure
if grep -q "// Resort data from mapping file" /home/user/webapp/public/lombok.html; then
    START_LINE=$(grep -n "// Resort data from mapping file" /home/user/webapp/public/lombok.html | cut -d: -f1)
    END_LINE=$(grep -n "renderResorts();" /home/user/webapp/public/lombok.html | tail -1 | cut -d: -f1)
    
    if [ -n "$START_LINE" ] && [ -n "$END_LINE" ]; then
        echo "Replacing JavaScript from line $START_LINE to $END_LINE"
        
        # Create temp file with new JavaScript (change REGION_ID)
        cat > /tmp/lombok-new-js.txt << 'JSEOF'
        // Region ID
        const REGION_ID = 'region-indonesia-lombok';
        
        async function loadResorts() {
            try {
                const response = await fetch(`/api/resorts?region_id=${REGION_ID}&is_active=true`);
                const result = await response.json();
                
                const container = document.getElementById('resorts-container');
                
                if (result.success && result.data.length > 0) {
                    const resorts = result.data;
                    
                    container.innerHTML = resorts.map(resort => {
                        // API already returns arrays, no need to parse
                        const features = Array.isArray(resort.features) ? resort.features : [];
                        const gallery = Array.isArray(resort.gallery_images) ? resort.gallery_images : [];
                        
                        // Category badge
                        const categoryLabels = {
                            'luxury': '럭셔리',
                            'premium': '프리미엄',
                            'standard': '스탠다드'
                        };
                        
                        const fallbackImg = 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=2080';
                        
                        return `
                            <div class="resort-card">
                                <div class="resort-content-wrapper">
                                    <div class="resort-header">
                                        <div class="resort-image">
                                            <img src="${resort.main_image_url || fallbackImg}" 
                                                 alt="${resort.name_ko}"
                                                 onerror="this.src='${fallbackImg}'">
                                            ${resort.category ? `<div class="resort-badge">${categoryLabels[resort.category] || resort.category}</div>` : ''}
                                        </div>
                                        <div class="resort-info">
                                            <div class="resort-category">${categoryLabels[resort.category] || 'RESORT'}</div>
                                            <h2 class="resort-name">${resort.name_ko}</h2>
                                            <p class="resort-description">${resort.description || ''}</p>
                                            ${features.length > 0 ? `
                                                <div class="resort-features">
                                                    ${features.slice(0, 4).map(feature => `
                                                        <div class="feature-item">
                                                            <i class="fas fa-check-circle"></i>
                                                            <span>${feature}</span>
                                                        </div>
                                                    `).join('')}
                                                </div>
                                            ` : ''}
                                            <a href="/inquiry" class="resort-cta">상담 신청하기</a>
                                        </div>
                                    </div>
                                    ${gallery.length > 0 ? `
                                        <div class="resort-gallery">
                                            ${gallery.slice(0, 6).map((img, index) => `
                                                <div class="gallery-item" onclick="openLightbox('${img}', '${resort.name_ko} - 이미지 ${index + 1}')">
                                                    <img src="${img}" alt="${resort.name_ko} - 이미지 ${index + 1}"
                                                         onerror="this.src='${fallbackImg}'">
                                                    <div class="gallery-overlay">
                                                        <i class="fas fa-search-plus"></i>
                                                    </div>
                                                </div>
                                            `).join('')}
                                        </div>
                                    ` : ''}
                                </div>
                            </div>
                        `;
                    }).join('');
                } else {
                    container.innerHTML = `
                        <div class="no-resorts">
                            <i class="fas fa-hotel"></i>
                            <p>현재 등록된 리조트가 없습니다.<br>곧 멋진 리조트들을 소개해드리겠습니다.</p>
                        </div>
                    `;
                }
            } catch (error) {
                console.error('Error loading resorts:', error);
                document.getElementById('resorts-container').innerHTML = `
                    <div class="error-resorts">
                        <i class="fas fa-exclamation-circle"></i>
                        <p>리조트 정보를 불러오는데 실패했습니다.<br>잠시 후 다시 시도해주세요.</p>
                    </div>
                `;
            }
        }
        
        // Lightbox functionality
        let currentModalImages = [];
        let currentImageIndex = 0;
        
        function openLightbox(imgSrc, caption) {
            // Find resort gallery images for navigation
            const galleries = document.querySelectorAll('.resort-gallery .gallery-item img');
            currentModalImages = Array.from(galleries).map(img => img.src);
            currentImageIndex = currentModalImages.indexOf(imgSrc);
            
            showModalImage(currentImageIndex);
            
            const modal = document.getElementById('imageModal');
            if (modal) {
                modal.style.display = 'flex';
            }
        }
        
        function closeModal() {
            const modal = document.getElementById('imageModal');
            if (modal) {
                modal.style.display = 'none';
            }
        }
        
        function changeModalImage(direction) {
            currentImageIndex += direction;
            if (currentImageIndex >= currentModalImages.length) {
                currentImageIndex = 0;
            } else if (currentImageIndex < 0) {
                currentImageIndex = currentModalImages.length - 1;
            }
            showModalImage(currentImageIndex);
        }
        
        function showModalImage(index) {
            const modalImg = document.getElementById('modalImage');
            const currentIndexEl = document.getElementById('currentImageIndex');
            const totalImagesEl = document.getElementById('totalImages');
            
            if (modalImg && currentModalImages.length > 0) {
                modalImg.src = currentModalImages[index];
                if (currentIndexEl) currentIndexEl.textContent = index + 1;
                if (totalImagesEl) totalImagesEl.textContent = currentModalImages.length;
            }
        }
        
        // Event listeners
        document.addEventListener('DOMContentLoaded', () => {
            // Load resorts
            loadResorts();
            
            // Close modal on background click
            const modal = document.getElementById('imageModal');
            if (modal) {
                modal.addEventListener('click', (e) => {
                    if (e.target === modal) {
                        closeModal();
                    }
                });
            }
            
            // Keyboard navigation
            document.addEventListener('keydown', (e) => {
                const modal = document.getElementById('imageModal');
                if (modal && modal.style.display === 'flex') {
                    if (e.key === 'Escape') {
                        closeModal();
                    } else if (e.key === 'ArrowLeft') {
                        changeModalImage(-1);
                    } else if (e.key === 'ArrowRight') {
                        changeModalImage(1);
                    }
                }
            });
        });
JSEOF

        # Use sed to replace the lines
        sed -i "${START_LINE},${END_LINE}d" /home/user/webapp/public/lombok.html
        sed -i "${START_LINE}r /tmp/lombok-new-js.txt" /home/user/webapp/public/lombok.html
        echo "✅ Lombok page JavaScript updated"
    else
        echo "⚠️ Could not find JavaScript section in lombok.html"
    fi
else
    echo "⚠️ Lombok page has different structure - needs manual update"
fi

echo ""
echo "✅ All pages updated!"
