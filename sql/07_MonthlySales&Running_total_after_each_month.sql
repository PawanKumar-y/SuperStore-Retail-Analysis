Select Month,
		Round(Revenue,4) as Revenue,
        Round(Sum(Revenue) Over (order by Month),4) as `Running Total`
from (
	Select date_format(Order_Date,'%Y/%m') as Month,
			Sum(Sales) as Revenue
	from orders
    Group By Month
)monthly_sales;
