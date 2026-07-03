with customer_details as(
	Select `Customer ID`,
			MAX(`Customer Name`) as `Customer Name`,
			MAX(Order_Date) as `Recent Order`,
            Count(`Order ID`) as `Number of orders placed by customer`,
            Round(Sum(Sales),4) as Monetary
	from orders
    group by `Customer ID`
)
Select * ,
CASE
	when Monetary >=5000 Then 'High Value Customer'
    when Monetary <5000 and Monetary>=1000 Then 'Average Customer'
    else 'Low Value Customer'
	End as Segment
from customer_details
order by monetary desc;