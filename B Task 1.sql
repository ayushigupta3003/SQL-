SELECT  COUNT(p.id) / COUNT(DISTINCT u.id) AS avg_posts_per_user,
COUNT(p.id) AS total_photos,
COUNT(DISTINCT u.id) AS total_users
FROM users u
LEFT JOIN photos p ON u.id = p.user_id;
