-- Considering the following data structure for a sales data store, where all values are either integers or reals.
-- Each record has eight attributes; the description specifies the list of permissible attribute values and
-- format (metadata).
-- OrderNo               Integer
-- ProductNo            Integer
-- Price                     Price of each product (Real/float)
-- Quantity                Integer
-- Sales                    Real/float
-- QtrId                     Quater (1-4)
-- MonthId                Integer(1-12)
-- YearId                   Integer
-- 
-- Based on the given structure here is the SQL code to create table. 

Code to create the table:
 create table sales(
    order_number int primary key,
    product_number int,
    price float,
	quantity int,
	sales float,
	quarter_id int,
	month_id int,
	year_id int
);


-- Code to insert data into the table:

insert into sales values (10107, 2, 85.7, 30, 2587, 1, 2, 2003);
insert into sales values (10107, 5, 95.8, 39, 3879.49, 1, 2, 2003);
insert into sales values (10121, 5, 71.5, 34, 2700, 1, 2, 2003);
insert into sales values (10134, 2, 94.74, 41, 3884.34, 3, 7, 2004);
insert into sales values (10134, 5, 100, 27, 3307.77, 3, 7, 2004);
insert into sales values (10159, 14, 100, 49, 5205.27, 4, 10, 2005);
insert into sales values (10168, 1, 96.66, 36, 3479.66, 4, 10, 2006);
insert into sales values (10180, 12, 100, 42, 4695.6, 4, 11, 2006);
 
-- To view the table:
select * form sales;


-- Code to select products which were sold in each month of each year data into the table:
 
select product_number, year_id, month_id, sum(quantity) as no_of_products from sales group by product_number, year_id, month_id
order by product_number asc, year_id asc, month_id asc;

