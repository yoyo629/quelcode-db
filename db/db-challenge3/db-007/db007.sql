SELECT
    id,
    chat_name,
    chat_overview,
    CASE is_send_controlled
        WHEN 0 THEN '許可'
        WHEN 1 THEN '禁止'
    END AS is_send_controlled,
    is_direct_chat,
    is_deleted,
    created_at,
    create_user_id,
    update_at,
    update_user_id
FROM chats
WHERE is_deleted = 0
    AND chat_overview LIKE '%ダイレクトチャット'
ORDER BY id ASC