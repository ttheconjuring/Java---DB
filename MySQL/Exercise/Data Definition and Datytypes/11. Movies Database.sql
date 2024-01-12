CREATE TABLE directors (
id INT AUTO_INCREMENT NOT NULL,
director_name VARCHAR(45) NOT NULL,
notes TEXT,
PRIMARY KEY (id));

CREATE TABLE genres (
id INT AUTO_INCREMENT NOT NULL,
genre_name VARCHAR(45) NOT NULL,
notes TEXT,
PRIMARY KEY (id));

CREATE TABLE categories (
id INT AUTO_INCREMENT NOT NULL,
category_name VARCHAR(45) NOT NULL,
notes TEXT,
PRIMARY KEY (id));

CREATE TABLE movies (
id INT AUTO_INCREMENT NOT NULL,
title VARCHAR(45) NOT NULL,
director_id INT NOT NULL,
copyright_year YEAR,
length INT,
genre_id INT NOT NULL,
category_id INT NOT NULL,
rating INT,
notes TEXT,
PRIMARY KEY (id),
FOREIGN KEY (director_id) REFERENCES directors(id),
FOREIGN KEY (genre_id) REFERENCES genres(id),
FOREIGN KEY (category_id) REFERENCES categories(id));

INSERT INTO directors (director_name, notes) VALUES
('Quentin Tarantino', NULL),
('Christopher Nolan', NULL),
('Martin Scorsese', NULL),
('Steven Spielberg', NULL),
('Ridley Scott', NULL);

INSERT INTO genres (genre_name, notes) VALUES
('Action', NULL),
('Comedy', NULL),
('Drama', NULL),
('Horror', NULL),
('Romance', NULL);

INSERT INTO categories (category_name, notes) VALUES
('Adventure', NULL),
('Animation', NULL),
('Crime', NULL),
('Documentary', NULL),
('Mystery', NULL);

INSERT INTO movies (title, director_id, copyright_year, length, genre_id, category_id, rating, notes) VALUES
('Pulp Fiction', 1, 1994, 154, 1, 3, 8, NULL),
('Inception', 2, 2010, 148, 1, 1, 9, NULL),
('The Departed', 3, 2006, 151, 3, 3, 8, NULL),
('Saving Private Ryan', 4, 1998, 169, 1, 1, 9, NULL),
('Alien', 5, 1979, 117, 4, 1, 8, NULL);
