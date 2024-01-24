CREATE TABLE mountains (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE peaks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    mountain_id INT NOT NULL,
    CONSTRAINT fk_mountain_id_mountains_id FOREIGN KEY (mountain_id)
        REFERENCES mountains (id)
);