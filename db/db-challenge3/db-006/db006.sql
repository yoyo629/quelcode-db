SELECT
    id,
    user_name,
    email,
    password,
    biography,
    phone_number,
    mobile_number,
    is_deleted,
    created_at,
    update_at
FROM
    users
ORDER BY 
    id ASC