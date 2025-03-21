SELECT l.user_id
FROM likes l
GROUP BY l.user_id
HAVING COUNT(l.photo_id) = (SELECT COUNT(*) FROM photos);
