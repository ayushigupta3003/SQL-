Select
Dayname(str_to_date (date ,'%d-%m-%Y')) as day_of_week,
sum(total) as total_sales
from walmart
group by day_of_week
order by Total_sales desc;