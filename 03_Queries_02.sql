-- Mục tiêu: Tìm sản phẩm mà không cần JOIN trực tiếp, sử dụng Subquery trong WHERE.

SELECT 
    ten_san_pham, 
    gia
FROM san_pham
WHERE ma_nha_cung_cap = (
    -- Truy vấn con: Tìm mã nhà cung cấp dựa trên tên
    SELECT ma_nha_cung_cap 
    FROM nha_cung_cap 
    WHERE ten_nha_cung_cap = 'Vinamilk Việt Nam'
);