--1. Thử nghiệm với GROUP BY
SELECT ten_sp, AVG(don_gia) as gia_trung_binh
FROM san_pham
GROUP BY ten_sp;
--. Sử dụng Window Function (OVER)
SELECT 
    ten_sp AS product_name, 
    don_gia AS price,
    AVG(don_gia) OVER () AS avg_overall_price
FROM san_pham;

--2: Câu lệnh SQL Phân tích theo Danh mục (Partition By)
SELECT 
    ma_nha_cung_cap AS category_id, 
    ten_sp AS product_name, 
    don_gia AS price,    
    ROUND(AVG(don_gia) OVER (PARTITION BY ma_nha_cung_cap), 2) AS avg_category_price
FROM san_pham;
--3
--Bước 1: UPDATE san_pham SET don_gia = 5000 WHERE ma_sp IN (1, 2);
UPDATE san_pham SET don_gia = 5000 WHERE ma_sp IN (1, 2);
--Bước 2: Thực hành: Viết câu lệnh SQL xếp hạng 
SELECT 
    ten_sp AS product_name, 
    don_gia AS price,
    ROW_NUMBER() OVER (ORDER BY don_gia DESC) AS row_num,
    RANK() OVER (ORDER BY don_gia DESC) AS rank_num,
    DENSE_RANK() OVER (ORDER BY don_gia DESC) AS dense_rank_num
FROM san_pham;

--4 : Câu lệnh SQL Tính Doanh thu Lũy kế theo Ngày
--Bước 1:Tạo một bảng tạm (daily_revenue) để tính tổng doanh thu cho mỗi ngày
WITH daily_revenue AS (
    SELECT 
        dh.ngay_thang_nam AS order_date,
        SUM(ct.tong_tien_tai_thoi_diem_ban) AS total_daily_revenue
    FROM don_hang dh
    INNER JOIN chi_tiet_don_hang ct ON dh.ma_don_hang = ct.ma_don_hang
    GROUP BY dh.ngay_thang_nam
)
--Bước 2: Sử dụng Window Function để tính cộng dồn
SELECT 
    order_date,
    total_daily_revenue,
    SUM(total_daily_revenue) OVER (ORDER BY order_date) AS running_total_revenue
FROM daily_revenue
ORDER BY order_date;
