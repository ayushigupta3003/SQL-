SELECT DAYNAME(created_at) AS registration_day, COUNT(id) AS total_users
FROM users
GROUP BY registration_day
ORDER BY total_users DESC;
