
-- TRUY VẤN: XẾP HẠNG NHÂN VIÊN THEO DOANH THU THÁNG 10/2025
-- Sử dụng DENSE_RANK để xếp hạng công bằng (không nhảy bậc khi trùng hạng)

SELECT 
    nv.ho_ten AS ten_nhan_vien,
    COALESCE(SUM(ct.so_luong * ct.gia_ban), 0) AS tong_doanh_thu,
    DENSE_RANK() OVER (ORDER BY SUM(ct.so_luong * ct.gia_ban) DESC NULLS LAST) AS thu_hang
FROM nhan_vien nv
LEFT JOIN don_hang dh ON nv.ma_nhan_vien = dh.ma_nhan_vien
LEFT JOIN chi_tiet_don_hang ct ON dh.ma_don_hang = ct.ma_don_hang
GROUP BY nv.ma_nhan_vien, nv.ho_ten
ORDER BY thu_hang;