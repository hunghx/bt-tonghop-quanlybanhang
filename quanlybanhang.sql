create database  quanlybanhang;
use quanlybanhang;

create table khachhang(
makh varchar(4) primary key ,
tenkh varchar(30) not null,
diachi varchar(50),
Ngaysinh date ,
soDt varchar(11) unique
);

create table Nhanvien(
manv varchar(4) primary key,
Hoten varchar(30) not null ,
gioitinh bit not null,
diachi varchar(50) not null,
ngaysinh date not null,
dienthoai varchar(11) unique,
email varchar(255) unique,
noisinh varchar(20) not null,
ngayvaolam date,
maNQL varchar(4)
);

create table nhacungcap(
mancc  varchar(5) primary key,
tenncc varchar(50) not null,
diachi  varchar(50) not null,
dienthoai varchar(11) not null unique,
email varchar(255) unique,
website varchar(100)
);

create table loaisp(
maloaisp varchar(4) primary key,
tenloaisp varchar(30) not null,
ghichu varchar(100) not null
);

create table sanpham (
masp varchar(4) primary key,
maloaisp varchar(4) not null,
tensp varchar(50) not null,
donvitinh varchar(10) not null,
ghichu varchar(100) ,
foreign key(maloaisp) references loaisp(maloaisp)
);

create table phieunhap(
sopn varchar(5) primary key,
manv varchar(4) not null,
mancc varchar(5) not null,
ngaynhap datetime not null default now(),
ghichu varchar(100),
foreign key(manv) references nhanvien(manv),
foreign key(mancc) references nhacungcap(mancc)
);

create table ctPhieunhap(
masp varchar(4) not null,
sopn varchar(5) not null,
soluong int not null default 0,
gianhap double not null check(gianhap>=0),
primary key(masp,sopn),
foreign key(masp) references sanpham(masp),
foreign key(sopn) references phieunhap(sopn)
);
create table phieuxuat(
sopx varchar(5) primary key,
manv varchar(4) not null,
makh varchar(4) not null,
ngayban datetime not null ,
ghichu text,
foreign key(manv) references nhanvien(manv),
foreign key(makh) references khachhang(makh)
);

create table ctPhieuxuat(
sopx varchar(5) not null,
masp varchar(4) not null,
soluong int not null check(soluong>0),
giaban double not null check(giaban>0),
primary key(masp,sopx),
foreign key(sopx) references phieuxuat(sopx),
foreign key(masp) references sanpham(masp)
);

-- chèn dữ liệu 
-- khách hàng
insert into khachhang (makh,tenkh,soDt) value
('L001','Nguyễn Văn G','0992727353'),
('KH02','Nguyễn Văn B','0984227353'),
('KH03','Nguyễn Văn C','0984527353'),
('KH04','Nguyễn Văn D','0984627353'),
('KH05','Nguyễn Văn E','0984827353');

select makh,tenkh,soDt from khachhang;


-- chỉnh sửa bản ghi
update khachhang set sodt = '0987654321' where makh like 'kh03';
update khachhang set tenkh = 'nguyen văn d' where sodt like '0984_27353'; -- % đại diện cho 1 chuôi, _ đại diện cho 1 kí tự
-- xóa 1 hoặc nhiều bản ghi 
delete from khachhang where makh LIKE 'kh03';
DELETE FROM khachhang;

-- thêm dữ liệu bảng nhân viên
insert into nhanvien value
-- ('N001','Hồ Xuân Hùng',1,'Nghệ An','1999-06-18','0974364738','hung@gmail.com','Nghệ An',null,null),
('N002','Trịnh công Phúc',1,'Hồ Chí Minh','2000-02-18','0974364928','phuc@gmail.com','Hồ Chí Minh',null,'N001'),
('N003','Cao Cường',1,'Hà Nam','2001-06-20','0974937738','cuong@gmail.com','Hà Nam',null,'N002'),
('N004','Lê Đức Phát',1,'Hồ Chí Minh','2004-05-30','097439473','phat@gmail.com','Hồ CHí Minh',null,'N001'),
('N005','Nguyễn Thị Minh Châu',1,'Hồ Chí Minh','1998-1-18','097438756','Chau@gmail.com','Hồ chí Minh',null,'N001');

-- dữ liệu bẩng loại sp
insert into loaisp  value 
('L001','QUẦN',''),
('L002','Mũ',''),
('L003','TRang Sức',''),
('L004','ÁO','');

-- thêm san phẩm
insert into sanpham value
('SP01','L004','Áo sơ mi nam','chiếc',''),
('SP02','L001','Quần sooc','chiếc',''),
('SP03','L002','Mũ LV','chiếc',''),
('SP04','L003','Nhẫn cưới','cặp',''),
('SP05','L004','Áo dài nữ','bộ','');
delete from sanpham where masp like 'SP04';
select * from sanpham;

select *
from sanpham sp left join loaisp lsp on sp.maloaisp = lsp.maloaisp
union 
 select *
from sanpham sp right join loaisp lsp on sp.maloaisp = lsp.maloaisp
 ;


select * from nhanvien where noisinh like 'Hà Nam' or noisinh like 'Hồ Chí Minh';
select * from nhanvien where ngaysinh between '2000-2-18' and '2005-12-12';


SELECT n.manv, n.hoten,m.hoten as `nguoi quan ly`
 FROM NHANVIEN as n 
 INNER JOIN NHANVIEN as m 
 ON n.MANQL = m.MANV;
