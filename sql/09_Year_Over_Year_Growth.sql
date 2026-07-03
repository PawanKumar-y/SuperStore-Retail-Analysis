With yearlysales as(
	select date_format(Order_Date,'%Y') as Year,
			Sum(Sales) as Revenue
	from orders
    group by Year
)
Select Year,
		Revenue,
        Lag(Revenue) over ( order by Year ) as `Previous Year`,
        Round((Revenue-Lag(Revenue) over ( order by Year ))*100 /Lag(Revenue) over ( order by Year ),2) as `Year Over Year Growth`
from yearlysales
