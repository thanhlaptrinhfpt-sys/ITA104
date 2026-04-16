-- TRUY VẤN BÁO CÁO: 10 GIAO DỊCH GẦN ĐÂY NHẤT
-- Mục tiêu: Tổng hợp thông tin từ nhiều bảng để có cái nhìn toàn diện về đơn hàng.

SELECT 
    dh.ma_don_hang,
    kh.ho_ten AS ten_khach_hang,
    nv.ho_ten AS ten_nhan_vien,
    dh.ngay_mua,
    -- Tính tổng tiền bằng cách sum các dòng trong chi tiết đơn hàng
    (SELECT SUM(ct.so_luong * ct.gia_ban) 
     FROM chi_tiet_don_hang ct 
     WHERE ct.ma_don_hang = dh.ma_don_hang) AS tong_tien_don_hang
FROM don_hang dh
JOIN khach_hang kh ON dh.ma_khach_hang = kh.ma_khach_hang
JOIN nhan_vien nv ON dh.ma_nhan_vien = nv.ma_nhan_vien
ORDER BY dh.ngay_mua DESC, dh.ma_don_hang DESC
LIMIT 10;