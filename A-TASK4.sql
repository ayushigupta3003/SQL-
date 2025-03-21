/*Identify and suggest the top five most commonly used hashtags on the platform*/
SELECT t.id, t.tag_name, COUNT(pt.tag_id) AS tag_usage_count
FROM photo_tags pt
JOIN tags t ON pt.tag_id = t.id
GROUP BY t.id, t.tag_name
ORDER BY tag_usage_count DESC
LIMIT 5;
