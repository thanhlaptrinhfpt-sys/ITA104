-- Chèn 50,000 khách hàng ảo
INSERT INTO khach_hang (ma_khach_hang, ho_ten, sdt, email, dia_chi)
SELECT 
    'KH' || (i + 50)::text,                          -- Bắt đầu từ mã KH51
    'Virtual Customer ' || i,
    '03' || lpad(i::text, 8, '0'),
    'user' || i || '@marketing.com',                 -- Email để chúng ta tìm kiếm
    'Virtual Address ' || i
FROM generate_series(1, 50000) s(i);

-- Chạy phân tích truy vấn
EXPLAIN ANALYZE 
SELECT * FROM khach_hang 
WHERE email = 'user45000@marketing.com';