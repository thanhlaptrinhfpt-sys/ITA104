-- TRUY VẤN BÁO CÁO: THỐNG KÊ DOANH THU THEO DANH MỤC
-- Điều kiện: Tổng doanh thu > 1.000.000đ và sắp xếp giảm dần.

SELECT 
    dm.ten_danh_muc,
    SUM(ct.so_luong * ct.gia_ban) AS tong_doanh_thu
FROM danh_muc dm
JOIN san_pham sp ON dm.ma_danh_muc = sp.ma_danh_muc
JOIN chi_tiet_don_hang ct ON sp.ma_san_pham = ct.ma_san_pham
GROUP BY dm.ten_danh_muc
HAVING SUM(ct.so_luong * ct.gia_ban) > 1000000
ORDER BY tong_doanh_thu DESC;