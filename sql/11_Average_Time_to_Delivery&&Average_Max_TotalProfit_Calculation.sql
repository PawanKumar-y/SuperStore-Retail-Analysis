Select `Ship Mode`,
		Count(*) as `Order Count`,
        Round(Avg((Ship_Date-Order_Date)),3) as `Average Time to Delivery`
from orders
Group by `Ship Mode`
order by `Ship Mode`;

Select Discount,
		Round(Avg(Profit),2) as `Average Profit`,
        Round(max(profit),2) as `Max Profit`,
        Round(sum(profit),2) as `Total Profit`
from orders
group by Discount
order by Discount
