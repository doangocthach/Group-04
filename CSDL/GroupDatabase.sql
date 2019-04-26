
create database if not exists CaffeManger; 
 -- drop database CaffeManger;
use CaffeManger;

create table if not exists Customer(
CustomerName nvarchar(255) unique,
CusID int primary key auto_increment,
userName nvarchar(200) not null,
UserPassword varchar(200) not null,
Address varchar(200) not null unique,
gotVip bool 
);

create table if not exists Items
(
ItemID int primary key ,
ItemName nvarchar(250) not null unique,
ItemPrice decimal (65,2) not null unique,
Quantity int not null,
ItemDescription nvarchar(1000) unique
);

create table if not exists Orders (
OrderDate datetime not null unique,
OrderID int primary key not null,
ItemName nvarchar(250) not null,
ItemPrice decimal (65,2) not null,
ItemDescription nvarchar(1000) ,
Note nvarchar(1000) unique,

constraint fk_OrderDetail_Items foreign key(ItemName) references Items(ItemName)
);
alter table Orders 
add foreign key(ItemPrice) references Items(ItemPrice),
add foreign key(ItemDescription) references Items(ItemDescription);

create table if not exists OrderDetail(
ItemCount int not null unique,
OrderID int not  null,
ItemID int not null,
ItemName nvarchar(250) not null,
ItemPrice decimal (65,2) not null,
constraint pk_OrderDetails primary key (OrderID, ItemID)
);

alter table OrderDetail
add foreign key(ItemID) references Items(ItemID),
add foreign key(OrderID) references Orders(OrderID);

create table if not exists Bills(
Bill_ID int primary key auto_increment,
CustomerName nvarchar(255) not null,
Amount decimal(65,2) not null,
Note nvarchar(1000)not null,
ItemCount int not null ,
OrderDate datetime not null,
OrderID int not null,
Address varchar(200) not null
);
-- drop table Bills;
alter table Bills
add foreign key(CustomerName) references Customer(CustomerName),
add foreign key(Note) references Orders(Note),
add foreign key(OrderDate) references Orders(OrderDate),
add foreign key(OrderID) references Orders(OrderID),
add foreign key(ItemCount) references  Items(ItemCount),
add foreign key(Address) references  Customer(Address);






