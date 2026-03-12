-- products with the highest revenue

select product,sub_category,revenue
from sales
order by revenue desc;


-- country with the most profit
select distinct country,
sum(profit) over(partition by country order by country) sum_prof
from sales
order by sum_prof desc;

-- state with the most profit
select distinct state, country,
max(profit) over(partition by state order by state desc) max_prof
from sales
order by max_prof desc;

-- category with the most profits
select DISTINCT sub_category,product_category,
max(profit) over(partition by sub_category order by sub_category) max_cat
from sales
order by max_cat desc;

select *
from sales

-- Monthly revenue trend
SELECT 
    YEAR(date)  AS year,
    MONTH(date) AS month,
    SUM(Revenue) AS TotalRevenue
FROM Sales
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;