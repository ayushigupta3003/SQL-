/*user with the most likes on a single photo wins*/
SELECT p.user_id, p.id AS photo_id, u.username, COUNT(l.photo_id) AS total_likes
FROM photos p
JOIN users u ON p.user_id = u.id
LEFT JOIN likes l ON p.id = l.photo_id
GROUP BY p.id, p.user_id, u.username
ORDER BY total_likes DESC
LIMIT 5;