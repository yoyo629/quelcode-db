SELECT
    u.user_name,
    c.chat_name,
    DATE_FORMAT(ju.join_at,'%Y-%m-%d')
    as join_at
FROM join_users AS ju
    JOIN users AS u
    ON ju.user_id = u.id
    JOIN chats AS c
    ON ju.chat_id = c.id
WHERE u.is_deleted = 0
    AND c.is_deleted = 0
ORDER BY ju.join_at ASC