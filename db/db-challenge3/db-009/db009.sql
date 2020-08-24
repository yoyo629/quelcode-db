SELECT
    COUNT(p.id) AS '投稿数',
    c.chat_name AS 'チャット名'
FROM posts AS p
    JOIN chats AS c ON p.chat_id = c.id
    JOIN users AS u ON p.post_user_id = u.id
WHERE p.is_deleted = 0
    AND u.is_deleted = 0
GROUP BY p.chat_id
ORDER BY COUNT(p.id) DESC