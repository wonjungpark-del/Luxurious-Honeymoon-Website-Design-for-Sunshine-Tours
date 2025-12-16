-- Regions (지역) Table
CREATE TABLE IF NOT EXISTS regions (
  id TEXT PRIMARY KEY,
  code TEXT UNIQUE NOT NULL,
  country TEXT NOT NULL,
  name_ko TEXT NOT NULL,
  name_en TEXT NOT NULL,
  description TEXT,
  image_url TEXT,
  display_order INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT 1,
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);

-- Resorts (리조트) Table
CREATE TABLE IF NOT EXISTS resorts (
  id TEXT PRIMARY KEY,
  region_id TEXT NOT NULL,
  name_ko TEXT NOT NULL,
  name_en TEXT NOT NULL,
  category TEXT NOT NULL,
  description TEXT,
  main_image_url TEXT,
  gallery_images TEXT,
  features TEXT,
  display_order INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT 1,
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL,
  FOREIGN KEY (region_id) REFERENCES regions(id)
);

-- Reviews (후기) Table
CREATE TABLE IF NOT EXISTS reviews (
  id TEXT PRIMARY KEY,
  destination TEXT NOT NULL,
  destination_kr TEXT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  rating INTEGER NOT NULL CHECK(rating >= 1 AND rating <= 5),
  author_name TEXT NOT NULL,
  travel_date TEXT NOT NULL,
  image_url TEXT,
  status TEXT DEFAULT 'pending' CHECK(status IN ('pending', 'approved', 'rejected')),
  is_featured BOOLEAN DEFAULT 0,
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);

-- Inquiries (문의) Table
CREATE TABLE IF NOT EXISTS inquiries (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL,
  destination TEXT NOT NULL,
  budget TEXT,
  travelers INTEGER DEFAULT 2,
  departure_date TEXT,
  duration TEXT,
  subject TEXT NOT NULL,
  message TEXT NOT NULL,
  status TEXT DEFAULT 'pending' CHECK(status IN ('pending', 'processing', 'completed')),
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);

-- Create Indexes for better performance
CREATE INDEX IF NOT EXISTS idx_resorts_region_id ON resorts(region_id);
CREATE INDEX IF NOT EXISTS idx_resorts_is_active ON resorts(is_active);
CREATE INDEX IF NOT EXISTS idx_resorts_display_order ON resorts(display_order);

CREATE INDEX IF NOT EXISTS idx_reviews_destination ON reviews(destination);
CREATE INDEX IF NOT EXISTS idx_reviews_status ON reviews(status);
CREATE INDEX IF NOT EXISTS idx_reviews_is_featured ON reviews(is_featured);
CREATE INDEX IF NOT EXISTS idx_reviews_created_at ON reviews(created_at);

CREATE INDEX IF NOT EXISTS idx_inquiries_status ON inquiries(status);
CREATE INDEX IF NOT EXISTS idx_inquiries_created_at ON inquiries(created_at);

CREATE INDEX IF NOT EXISTS idx_regions_code ON regions(code);
CREATE INDEX IF NOT EXISTS idx_regions_country ON regions(country);
CREATE INDEX IF NOT EXISTS idx_regions_is_active ON regions(is_active);
