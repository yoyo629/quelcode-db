BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE 
    tasks
SET 
    is_task_completed = 1,
    update_user_id = 1
WHERE
    is_deleted = 0
AND
    created_at between '2020/4/26 09:00:00' and '2020/4/26 11:30:00'
AND
    is_task_completed = 0;
commit;