Select `Product Id`, MAX(`Product Name`) as `Product Name`, Sum(`Sales`) as Revenue
from orders 
group by `Product Id`
order by Revenue desc
Limit 10;
-- this query will generate top 10 most revenue generating products 
