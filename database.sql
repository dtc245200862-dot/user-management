CREATE DATABASE IF NOT EXISTS demo;
USE demo;

CREATE TABLE IF NOT EXISTS users (
    id INT(3) NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(120),
    PRIMARY KEY (id)
);

-- 1. Tạo Stored Procedure để lấy thông tin User theo ID
DELIMITER $$
DROP PROCEDURE IF EXISTS get_user_by_id$$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT users.name, users.email, users.country
    FROM users
    WHERE users.id = user_id;
END$$
DELIMITER ;

-- 2. Tạo Stored Procedure để thêm mới một User
DELIMITER $$
DROP PROCEDURE IF EXISTS insert_user$$
CREATE PROCEDURE insert_user(
    IN user_name VARCHAR(50),
    IN user_email VARCHAR(50),
    IN user_country VARCHAR(50)
)
BEGIN
    INSERT INTO users(name, email, country) 
    VALUES(user_name, user_email, user_country);
END$$
DELIMITER ;

-- 3. Tạo bảng Permission
CREATE TABLE IF NOT EXISTS permission (
    id INT(11) PRIMARY KEY,
    name VARCHAR(50)
);

-- 4. Tạo bảng trung gian User_Permission
CREATE TABLE IF NOT EXISTS user_permission (
    user_id INT(11),
    permission_id INT(11),
    PRIMARY KEY(user_id, permission_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (permission_id) REFERENCES permission(id)
);

-- 5. Thêm dữ liệu mẫu cho bảng Permission
INSERT IGNORE INTO permission(id, name) VALUES (1, 'add');
INSERT IGNORE INTO permission(id, name) VALUES (2, 'edit');
INSERT IGNORE INTO permission(id, name) VALUES (3, 'delete');
INSERT IGNORE INTO permission(id, name) VALUES (4, 'view');

-- 6. Tạo bảng Employee
CREATE TABLE IF NOT EXISTS Employee (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    salary DECIMAL(15, 2) NOT NULL,
    created_Date TIMESTAMP,
    PRIMARY KEY (id)
);


