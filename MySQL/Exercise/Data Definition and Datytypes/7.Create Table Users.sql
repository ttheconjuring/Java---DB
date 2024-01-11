CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(26) NOT NULL,
    profile_picture BLOB,
    last_login_time TIMESTAMP,
    is_deleted ENUM('true', 'false')
);

INSERT INTO users (username, password) VALUES 
("pesho", "ohsep"),
("ivan", "navi"),
("lili", "ilil"),
("ani", "ina"),
("desi", "ised");