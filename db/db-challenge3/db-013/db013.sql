BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE 
    users
SET
    is_deleted = 1
WHERE
    phone_number IS NULL
AND
    mobile_number IS NULL
AND
    is_deleted = 0;
COMMIT;