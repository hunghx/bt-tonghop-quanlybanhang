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


