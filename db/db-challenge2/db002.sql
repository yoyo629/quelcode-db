CREATE TABLE users
(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    biography VARCHAR(1000),
    phone_number VARCHAR(13),
    mobile_number VARCHAR(13),
    is_deleted TINYINT(1) NOT NULL DEFAULT '0',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats
(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    chat_name VARCHAR(100) NOT NULL,
    chat_overview VARCHAR(1000),
    is_send_controlled TINYINT(1) NOT NULL DEFAULT '0',
    is_direct_chat TINYINT(1) NOT NULL DEFAULT '0',
    is_deleted TINYINT(1) NOT NULL DEFAULT '0',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    create_user_id INT(11) NOT NULL,
    update_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_user_id INT(11) NOT NULL,
    FOREIGN KEY(create_user_id) REFERENCES users(id),
    FOREIGN KEY(update_user_id) REFERENCES users(id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE posts
(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    chat_id INT(11) NOT NULL,
    post_content VARCHAR(1000) NOT NULL,
    post_file_name VARCHAR(100),
    is_deleted TINYINT(1) NOT NULL DEFAULT '0',
    posted_at DATETIME  NULL DEFAULT CURRENT_TIMESTAMP,
    post_user_id INT(11) NOT NULL,
    update_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_user_id INT(11) NOT NULL,
    FOREIGN KEY(chat_id) REFERENCES chats(id),
    FOREIGN KEY(post_user_id) REFERENCES users(id),
    FOREIGN KEY(update_user_id) REFERENCES users(id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE tasks
(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    chat_id INT(11) NOT NULL,
    task_user_id INT(11) NOT NULL,
    task_content VARCHAR(1000) NOT NULL,
    task_limit_date DATETIME,
    is_task_completed TINYINT(1) NOT NULL DEFAULT '0',
    is_deleted TINYINT(1) NOT NULL DEFAULT '0',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    create_user_id INT(11) NOT NULL,
    update_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_user_id INT(11) NOT NULL,
    FOREIGN KEY(chat_id) REFERENCES chats(id),
    FOREIGN KEY(task_user_id) REFERENCES users(id),
    FOREIGN KEY(create_user_id) REFERENCES users(id),
    FOREIGN KEY(update_user_id) REFERENCES users(id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE join_users
(
    user_id INT(11) NOT NULL PRIMARY KEY,
    chat_id INT(11) NOT NULL PRIMARY KEY,
    join_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(chat_id) REFERENCES chats(id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;