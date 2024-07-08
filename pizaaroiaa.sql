create database pizzariaa;
create table orders (
order_ID INT not null,
order_date date not null,
order_time time not null,
primary key (order_ID));
select * from pizzariaa.orders


create table orders_details (
order_details_id int not null,
order_ID INT not null,
pizza_id text not null,
quantity int not null,
primary key (order_details_id));

select * from pizzariaa.orders_details;


