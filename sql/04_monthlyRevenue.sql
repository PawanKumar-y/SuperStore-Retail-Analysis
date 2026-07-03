Select Date_format(`Order_Date`,'%Y/%m') as Month,
Sum(`Sales`) as Revenue
from orders
Group by Month
Order by Month;
-- this query groups the order date on basis of month and then sums up revenue for that month and displays it for getting monthly revenue over 4 years (total dataset contains
-- 4 years
