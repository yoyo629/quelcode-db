BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE 
    chats
SET 
    is_send_controlled = 0,
    update_user_id = 1
WHERE
    is_deleted = 0
AND
    is_send_controlled = 1
AND 
    id NOT IN (SELECT chat_id FROM join_users WHERE user_id = 1);
COMMIT;