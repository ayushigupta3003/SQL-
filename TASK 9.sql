Select `customer ID`,
 sum(total) as `total revenue`
 from walmart
 group by `customer ID`
 order by `total revenue` desc
Limit 5;
    
    