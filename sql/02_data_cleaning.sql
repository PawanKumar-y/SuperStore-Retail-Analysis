show columns from orders;

select * from orders limit 15;
-- whenever there is alter table and drop table commands dont execute it multiple times it may cause unknown effects
Alter table orders
ADD COLUMN order_date Date,
ADD COLUMN ship_date Date;

Update orders
set
	order_date=str_to_date(`Order Date`,'%m/%d/%Y'),
    ship_date=str_to_date(`Ship Date`,'%m/%d/%Y');
    
Alter Table orders
Drop Column `Order Date`,
Drop Column `Ship Date`;

-- i have renamed it to Order_Date and not Order Date because if i re-execute it fully by accident i would lose order date with datatype date and i have to start
-- all over again from importing the table etc.. hence this is the best if i re-execute it fully now it will throw errors because update and alter table drop and alter table 
-- rename Order Date and Ship Date doesnt exist and cant be dropped anymore and so are the other commands

Alter Table orders
Rename Column `order_date` To `Order_Date`,
Rename Column `ship_date` To `Ship_Date`;

show columns from orders;

select * from orders limit 15;