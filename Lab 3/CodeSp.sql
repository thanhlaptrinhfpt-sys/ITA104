SELECT * FROM public.sp
ORDER BY masp ASC 
INSERT into SP VALUES
(1,'But',3,5000),
(2,'Vo',5,5000),
(3,'Thuoc',5,4000),
(4,'Phan',6,4000),
(5,'So tay',5,4000),
(6,'Giay A4',8,6000),
(7,'Muc',5,3000),
(8,'But chi',6,3000),
(9,'Keo Lac',6,6000),
(10,'Kem Sua Dua',5,5000),
(11,'Kem Oc Que',6,5000),
(12,'Kem Hop',8,4000),
(13,'Kem Socola',6,5000),
(14,'Sua Chua',6,5000),
(15,'Bim Bim',8,3000),
(16,'Banh My',5,3000),
(17,'Banh Bong Lan ',8,6000),
(18,'Banh Dau Xanh',9,5000),
(19,'Banh Gao Ichi',6,7000),
(20,'Kho GA',8,7000);

-- Lay cot Ten va Gia tu bang

SELECT TenSP,DonGia FROM SP;
-- Doi ten thanh 'TenSanPham' va 'Don Gia'
SELECT TenSP AS TenSanPham,DonGia AS DonGia FROM SP;
--Lay ten va gia cua tat ca sp, sap xep theo thu tu Giam dan
SELECT TenSP,DonGia FROM SP ORDER BY DonGia DESC;
--Lay Ten Va Gia cua 3 San pham thap nhat trong bang SP
SELECT TenSP, DonGia FROM SP ORDER BY DonGia ASC LIMIT 3;