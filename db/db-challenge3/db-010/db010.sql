SELECT
    u.user_name AS 'ユーザー名',
    latest_post.最新投稿日時 AS '最新投稿日時',
    c.chat_name AS 'チャット名'
FROM
    (
    SELECT
        p.chat_id AS 'チャットID',
        MAX(p.posted_at) AS '最新投稿日時'
    FROM posts AS p
        JOIN users AS u ON u.id = p.post_user_id
    WHERE u.is_deleted = 0
        AND p.is_deleted = 0
    GROUP BY chat_id
) AS latest_post
    JOIN chats AS c ON c.id = latest_post.チャットID
    JOIN posts AS p ON latest_post.最新投稿日時 = p.posted_at
    JOIN users AS u ON p.post_user_id = u.id
ORDER BY c.id ASC