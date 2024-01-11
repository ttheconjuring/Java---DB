CREATE TABLE people (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(200) NOT NULL,
picture LONGBLOB,
height DECIMAL(5,2),
weight DECIMAL(5,2),
gender ENUM('m', 'f') NOT NULL,
birthdate DATE NOT NULL,
biography TEXT
);

INSERT INTO people (name, picture, height, weight, gender, birthdate, biography) VALUES 
("Petar", NULL, NULL, NULL, 'm', "2005-01-30", NULL),
("Ivan", NULL, NULL, NULL, 'f', "2005-03-20", NULL),
("Joro", NULL, NULL, NULL, 'f', "2003-04-19", NULL),
("Misho", NULL, NULL, NULL, 'm', "2002-05-01", NULL),
("Ivo", NULL, NULL, NULL, 'm', "2000-01-21", NULL);