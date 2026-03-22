SELECT * FROM public.kh
ORDER BY makh ASC 

INSERT into KH VALUES
(1,'Ha Phuong Linh',0123456786,'Hoai Duc'),
(2,'Vo Hoai Anh',0136234897,'Cau Dien'),
(3,'Than Duc Hai',0226556986,'Phan Tay Nhac'),
(4,'Phan Van Hung',0234567898,'Hoe Thi'),
(5,'Ly Quoc Tuan',0963257486,'Ha Dong'),
(6,'Tran Van Binh',0369876889,'Cau Giay'),
(7,'Mac Van Quang',0399987885,'Tram Troi'),
(8,'Bui Van Thuy',0326968968,'Duc Dien'),
(9,'Kieu Bao Linh',0366552222,'De la Thanh'),
(10,'Trinh Van Bo',0369687555,'My Dinh');

-- Lay Thong tin Khach Hang co chu "Van"
SELECT * FROM KH WHERE TenKH like  '% Van %';