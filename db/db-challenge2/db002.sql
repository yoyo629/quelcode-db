CREATE TABLE users
(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    biography VARCHAR(1000),
    phone_number VARCHAR(13),
    mobil_number VARCHAR(13),
    delete_flag TINYINT(1) NOT NULL DEFAULT '0',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats
(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    chat_name VARCHAR(100) NOT NULL,
    chat_overview VARCHAR(1000),
    file_send_control TINYINT(1) NOT NULL DEFAULT '1',
    direct_chat_flag TINYINT(1) NOT NULL,
    delete_flag TINYINT(1) NOT NULL DEFAULT '0',
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
    chat_id INT(11) NOT NULL REFERENCES chats(id),
    post_content VARCHAR(1000) NOT NULL,
    post_file VARCHAR(100),
    delete_flag TINYINT(1) NOT NULL DEFAULT '0',
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
    chat_id INT(11) NOT NULL REFERENCES chats(id),
    task_user_id INT(11) NOT NULL,
    task_content VARCHAR(1000) NOT NULL,
    task_limit_date DATETIME,
    task_complete_flag TINYINT(1) NOT NULL DEFAULT '0',
    delete_flag TINYINT(1) NOT NULL DEFAULT '0',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    create_user_id INT(11) NOT NULL REFERENCES users(id),
    update_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_user_id INT(11) NOT NULL REFERENCES users(id),
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