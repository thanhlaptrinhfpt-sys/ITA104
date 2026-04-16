-- Tạo Index để tăng tốc tìm kiếm theo email
CREATE INDEX idx_khach_hang_email ON khach_hang(email);
-- Chạy lại phân tích để so sánh kết quả
EXPLAIN ANALYZE 
SELECT * FROM khach_hang 
WHERE email = 'user45000@marketing.com';