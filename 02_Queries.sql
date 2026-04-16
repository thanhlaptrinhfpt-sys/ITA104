-- 1. DANH MỤC SẢN PHẨM (5 dòng)
INSERT INTO danh_muc (ma_danh_muc, ten_danh_muc) VALUES
('DM001', 'Sữa & Thực phẩm sữa'),
('DM002', 'Bánh kẹo & Đồ ăn vặt'),
('DM003', 'Gia vị & Đồ khô'),
('DM004', 'Hóa mỹ phẩm'),
('DM005', 'Đồ gia dụng');

-- 2. NHÀ CUNG CẤP (5 dòng)
INSERT INTO nha_cung_cap (ma_nha_cung_cap, ten_nha_cung_cap, sdt, email, dia_chi) VALUES
('NCC01', 'Vinamilk Việt Nam', '02838330737', 'vinamilk@gmail.com', 'TP. Hồ Chí Minh'),
('NCC02', 'Acecook Việt Nam', '02838154018', 'acecook@gmail.com', 'TP. HCM'),
('NCC03', 'Unilever Việt Nam', '02838236622', 'unilever@gmail.com', 'Quận 7, TP. HCM'),
('NCC04', 'Kinh Đô Mondelez', '02838270838', 'mondelez@gmail.com', 'Bình Dương'),
('NCC05', 'Masan Group', '02837561868', 'masan@gmail.com', 'Quận 1, TP. HCM');

-- 3. KHUYẾN MÃI (3 dòng)
INSERT INTO khuyen_mai (ma_khuyen_mai, ten_chuong_trinh, phan_tram_giam, ngay_bat_dau, ngay_ket_thuc) VALUES
('KM01', 'Chào hè rực rỡ', 10, '2026-04-01', '2026-04-30'),
('KM02', 'Tri ân khách hàng', 15, '2026-05-01', '2026-05-05'),
('KM03', 'Siêu sale cuối tháng', 20, '2026-04-25', '2026-04-30');

-- 4. NHÂN VIÊN (10 dòng)
INSERT INTO nhan_vien (ma_nhan_vien, ho_ten, vi_tri, ngay_vao_lam, sdt) VALUES
('NV001', 'Nguyễn Văn A', 'Quản lý', '2025-01-10', '0901234561'),
('NV002', 'Trần Thị B', 'Thu ngân', '2025-02-15', '0901234562'),
('NV003', 'Lê Văn C', 'Thu ngân', '2025-02-15', '0901234563'),
('NV004', 'Phạm Thị D', 'Kho', '2025-03-01', '0901234564'),
('NV005', 'Hoàng Văn E', 'Bảo vệ', '2025-01-20', '0901234565'),
('NV006', 'Đỗ Thị F', 'Bán hàng', '2025-03-10', '0901234566'),
('NV007', 'Vũ Văn G', 'Bán hàng', '2025-03-12', '0901234567'),
('NV008', 'Phan Thị H', 'Kế toán', '2025-01-05', '0901234568'),
('NV009', 'Lý Văn I', 'Thu ngân', '2025-04-01', '0901234569'),
('NV010', 'Bùi Thị K', 'Tạp vụ', '2025-01-15', '0901234570');

--50 Khách hàng
INSERT INTO khach_hang (ma_khach_hang, ho_ten, sdt, email, dia_chi)
SELECT 
    'KH' || lpad(i::text, 3, '0'),
    'Khách hàng ' || i,
    '0912' || lpad(i::text, 6, '0'),
    'customer' || i || '@gmail.com',
    'Địa chỉ khách hàng số ' || i
FROM generate_series(1, 50) s(i);

-- 6. SẢN PHẨM (30 dòng mẫu)
INSERT INTO san_pham (ma_san_pham, ten_san_pham, gia, ma_danh_muc, ma_nha_cung_cap)
SELECT 
    'SP' || lpad(i::text, 3, '0'),
    'Sản phẩm mẫu số ' || i,
    (random() * 200000 + 10000)::numeric(18,2),
    'DM00' || (mod(i, 5) + 1),
    'NCC0' || (mod(i, 5) + 1)
FROM generate_series(1, 30) s(i);

--Chi tiết đơn hàng 100 dòng
INSERT INTO chi_tiet_don_hang (ma_don_hang, ma_san_pham, so_luong, gia_ban)
SELECT 
    'DH' || lpad(i::text, 3, '0'),
    'SP' || lpad((mod(i, 30) + 1)::text, 3, '0'),
    (random() * 5 + 1)::int,
    (random() * 50000 + 10000)::numeric(18,2)
FROM generate_series(1, 100) s(i);
# don hang 100 dong
INSERT INTO don_hang (ma_don_hang, ngay_mua, ma_khach_hang, ma_nhan_vien, ma_khuyen_mai)
SELECT 
    'DH' || lpad(i::text, 3, '0'),                             -- Mã DH001, DH002...
    current_date - (random() * 60)::int, 
    'KH' || lpad((mod(i, 50) + 1)::text, 3, '0'),             -- Mã KH001 đến KH050
    'NV' || lpad((mod(i, 10) + 1)::text, 3, '0'),             -- ĐÃ SỬA: Sẽ ra NV001 đến NV010
    'KM' || lpad((mod(i, 3) + 1)::text, 2, '0')               -- Mã KM01, KM02, KM03
FROM generate_series(1, 100) s(i);
