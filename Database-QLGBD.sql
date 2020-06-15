﻿Create database QLGBD
use QLGBD
go 

USE QLGBD

go
-- tạo bảng đội bóng
create table Dangnhap
( 
 taikhoan varchar(45),
 matkhau varchar(45),
)


create table DOIBONG
(
MaDoi varchar(45) primary key not null,
TenDoi varchar(45),
SanNha varchar(45),
)

go

-- tạo bảng cầu thủ
create table CAUTHU
(
MaCauThu varchar(45) primary key not null,
TenCauThu varchar(45),
NgaySinh Datetime,
MaLoaiCauThu varchar(45),
GhiChu varchar(45),
MaDoi varchar(45),
)

go 

-- tạo bảng loại cầu thủ
Create table LOAICAUTHU
(
MaLoaiCauThu varchar(45) primary key not null ,
TenLoaiCauThu varchar(45),
)

go

-- tạo bảng bàn thắng
create table BANTHANG
(
MaBanThang varchar(45) primary key not null ,
MaCauThu varchar(45),
MaLoaiBanThang varchar(45),
ThoiDiem varchar(45),
MaTranDau varchar(45),
)

go

-- tạo bảng loại bàn thắng
create table LOAIBANTHANG
(
MaLoaiBanThang varchar(45) primary key not null ,
TenLoaiBanThang varchar(45),
)

go

-- tạo bảng trận đấu
create table TRANDAU
(
MaTranDau varchar(45) primary key not null ,
DoiChuNha varchar(45),
DoiKhach varchar(45),
NgayThiDau datetime,
GioThiDau time,
SanThiDau varchar(45),
TySo varchar(10),
MaVongDau varchar(45),

)


go

-- tạo bảng vòng đấu
create table VONGDAU 
(
MaVongDau varchar(45) primary key not null ,
TenVongDau varchar(45),
)


go

-- tạo bản tham số
create table THAMSO 
(
idThamSo int,
TuoiToiThieu int,
TuoiToiDa int,
SoCauThuToiThieu int,
SoCauThuToiDa int,
SoCauThuNuocNgoaiToiDa int,
ThoiDiemGhiBanToiDa int,
DiemSoThang int,
DiemSoHoa int,
DiemSoThua int,
ThuTuUuTienXepHang int,
SoLuongLoaiBanThang int,
)

go


-- tạo liên kết khóa ngoại cho các bảng

alter table CAUTHU add constraint fk_MaDoi foreign key (MaDoi) references DOIBONG(MaDoi)
alter table CAUTHU add constraint fk_MaLoaiCauThu foreign key (MaLoaiCauThu) references LOAICAUTHU(MaLoaiCauThu)
alter table BANTHANG add constraint fk_MaCauThu foreign key (MaCauThu) references CAUTHU(MaCauThu)
alter table BANTHANG add constraint fk_MaTranDau foreign key (MaTranDau) references TranDau(MaTranDau)
alter table TRANDAU add constraint fk_MaVongDau foreign key (MaTranDau) references VONGDAU(MaVongDau)
alter table BANTHANG add constraint fk_MaLoaiBanThang foreign key (MaLoaiBanThang) references LOAIBANTHANG(MaLoaiBanThang)

-- tạo các ràng buộc theo các yêu cầu

-- YÊU CẦU 1


-- Quy định về tuổi cầu thủ
alter table THAMSO add  constraint check_Sotuoi Check ( TuoiToiThieu >= 16 and TuoiToiDa <= 40 )

go 

-- Quy định về loại cầu thủ
alter table LOAICAUTHU add constraint check_LoaiCauThu check ( TenLoaiCauThu = ' Trong nước ' or TenLoaiCauThu = ' Nước Ngoài ' ) 

go 

-- Quy định về số cầu thủ trong đội
alter table THAMSO add  constraint check_SoCauThu Check ( SoCauThuToiThieu >= 15 and SoCauThuToiDa <= 22 and SoCauThuNuocNgoaiToiDa <= 3 )

go

-- YÊU CẦU 2
-- YÊU CẦU 3

-- Quy định về bàn thắng và thời điểm ghi bàn
alter table LOAIBANTHANG add constraint check_LoaiBanThang Check ( MaLoaiBanThang = 'A' or MaLoaiBanThang = 'B' or MaLoaiBanThang = 'C')
alter table THAMSO add constraint check_ThoiDiemGhiBan Check ( ThoiDiemGhiBanToiDa >= 0 and ThoiDiemGhiBanToiDa <= 90)

INSERT INTO Dangnhap(taikhoan,matkhau)
 VALUES('ADMIN','ADMIN')









