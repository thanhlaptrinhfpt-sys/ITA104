--1
EXPLAIN ANALYZE
SELECT * FROM khach_hang WHERE sdt = '0910099999';
--2
CREATE INDEX idx_khach_hang_sdt ON khach_hang(sdt);
EXPLAIN ANALYZE
SELECT * FROM khach_hang WHERE sdt = '0910099999';
--3
EXPLAIN ANALYZE
INSERT INTO khach_hang (ten, sdt, dia_chi)
VALUES ('Test Index User', '0999999999', '123 Test Index');
--4
CREATE INDEX idx_khach_hang_dia_chi ON khach_hang(dia_chi);
EXPLAIN
SELECT * FROM khach_hang
WHERE dia_chi = 'Address 500' OR sdt LIKE '091001%';