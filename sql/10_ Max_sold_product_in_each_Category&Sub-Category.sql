With maxSale as(
	Select  Category,
			MAX(Sales) as `Max Sales`
	from orders
	group  by Category
)
Select o.`Order ID`,
	   o.`Product Name`,
	   o.Category,
       m.`Max Sales`
from orders o
Join maxSale m
on o.Category = m.Category
where o.Sales = m.`Max Sales`;


With maxSales as(
	Select Category,
			`Sub-Category`,
            Count(*) as Count,
            Max(Sales) as `Max Sales`
	from orders
    group by Category,
			 `Sub-Category`
)
Select o.Category,
	   o.`Sub-Category`,
       o.`Order ID`,
       o.`Product ID`,
       o.Sales as `Max Sub Category Sales`,
       m.Count
from orders o
join maxSales m
on m.Category=o.Category and m.`Sub-Category`=o.`Sub-Category`
where o.sales=m.`Max Sales`
order by 
	o.Category,
    o.`Sub-Category`;


