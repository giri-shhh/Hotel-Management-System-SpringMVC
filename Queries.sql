######### User Table ############

drop table USERS CASCADE CONSTRAINTS;

create table users(
user_id number(4) primary key,
user_name varchar2(20) not null,
password varchar2(10) not null,
role varchar2(25) not null,
phone_no varchar2(10) not null, 
address varchar2(25)not null,
email varchar2(40)not null
);

insert into users values(77,'Girish','walker','admin','7204994791','Shimoga','pgirisha77@gmail.com');

select * from users;

########## Hotel Table ############

drop table HOTEL CASCADE CONSTRAINTS;

create table hotel(
hotel_id number(4) primary key,
hotel_name varchar2(20) not null,
city varchar2(10) not null,
address varchar2(25) not null,
description varchar2(50) not null,
avg_rate_per_night number(8,2) not null,
phone_no1 varchar2(10) not null,
phone_no2 varchar2(10),
rating number(3) not null,
email varchar2(40) not null,
fax varchar2(15),
photo_Path varchar2(255)
);
 
insert into hotel values(1,'Parkinn','Pune','Phase 1','very nice',5000,'9876543210','9874561230',4,'support@parkinn.com','123456','https://www.afristay.com/media/thumbnails/pictures/places/22032/34738632.jpg.1366x768_q85_crop_upscale.jpg');

######## RoomDetails Table ##########

DROP TABLE ROOMDETAILS CASCADE CONSTRAINTS;

create table roomdetails(
hotel_id number(4),
room_id number(4) primary key,
room_no varchar2(3) not null,
room_type varchar2(20) not null,
per_night_rate number(8,2) not null,
availability varchar2(3)not null,
photo_path varchar2(255) not null,
foreign key(hotel_id) references hotel(hotel_id) on delete cascade);

hotel room 1: https://www.corinthia.com/application/files/5214/7582/3494/business-room_02.jpg

https://www.corinthia.com/application/files/3115/0454/0616/luxury-hotel-rooms-london-corinthia-hotel-superior-king.jpg

https://www.corinthia.com/application/files/5314/7392/7615/executive-family-room.jpg

######### BookingDetails #############

DROP TABLE BOOKINGDETAILS CASCADE CONSTRAINTS;

create table bookingdetails(
booking_id number(4) primary key,
room_id number(4) not null,
user_id number(4) not null,
booked_from date not null,
booked_to date not null,
no_of_adults number(2) not null,
no_of_children number(2),
amount number(8,2) not null,
photo_path varchar2(255) not null,
foreign key(room_id) references roomdetails(room_id) on delete cascade,
foreign key(user_id) references users(user_id));


############# Sequences ##############

DROP SEQUENCE USER_SEQ;
CREATE SEQUENCE USER_SEQ START WITH 1;

DROP SEQUENCE HOTEL_SEQ;
CREATE SEQUENCE HOTEL_SEQ START WITH 1;

DROP SEQUENCE ROOM_SEQ;
CREATE SEQUENCE ROOM_SEQ START WITH 1;

DROP SEQUENCE BOOK_SEQ;
CREATE SEQUENCE BOOK_SEQ START WITH 1;

select * from users
select * from hotel

show databases
use hoteldetails