BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
DELETE
FROM
    join_users
WHERE
    user_id IN(
        SELECT
            id
        FROM
            users
        WHERE
            is_deleted = 1);
COMMIT;