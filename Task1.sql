/*five oldest users on Instagram from the provided database*/
SELECT username , id, 	DATE(created_at) AS created_date 
FROM users
ORDER BY created_at ASC
LIMIT 5;