/*Identify users who have never posted a single photo on Instagram*/
SELECT u.id, u.username
FROM users AS u
LEFT JOIN photos AS p ON u.id = p.user_id
WHERE p.user_id IS NULL; 
