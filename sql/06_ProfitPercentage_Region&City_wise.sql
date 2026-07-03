Select Region,
	Sum(Sales) as Revenue,
    Sum(Profit) as Profit,
    Round(Sum(Profit)*100/Sum(Sales),2) as Profit_Margin_Percentage
from orders
Group by Region
Order by Revenue desc;
    
Select City,
	COUNT(*) AS order_count,
	Sum(Sales) as Revenue,
    Sum(Profit) as Profit,
    Round(Sum(Profit)*100/Sum(Sales),2) as Profit_Margin_Percentage
from orders
Group by City
-- Having order_count >=20
Order by Profit_Margin_Percentage desc;
    