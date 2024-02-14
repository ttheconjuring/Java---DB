CREATE TABLE continents (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE positions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE,
    description TEXT,
    is_dangerous TINYINT(1)
);

CREATE TABLE preserves (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    latitude DECIMAL(9 , 6 ),
    longitude DECIMAL(9 , 6 ),
    area INT,
    type VARCHAR(20),
    established_on DATE
);

CREATE TABLE countries (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE,
    country_code VARCHAR(10) NOT NULL UNIQUE,
    continent_id INT NOT NULL,
    CONSTRAINT fk_continent_id FOREIGN KEY (continent_id)
        REFERENCES continents (id)
);

CREATE TABLE workers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    age INT,
    personal_number VARCHAR(20) NOT NULL UNIQUE,
    salary DECIMAL(19 , 2 ),
    is_armed TINYINT(1),
    start_date DATE,
    preserve_id INT,
    position_id INT NOT NULL,
    CONSTRAINT fk_preserve_id FOREIGN KEY (preserve_id)
        REFERENCES preserves (id),
    CONSTRAINT fk_position_id FOREIGN KEY (position_id)
        REFERENCES positions (id)
);

CREATE TABLE countries_preserves (
    country_id INT NOT NULL,
    preserve_id INT NOT NULL,
    CONSTRAINT fk_country_id FOREIGN KEY (country_id)
        REFERENCES countries (id),
    CONSTRAINT fk_preserve_id_2 FOREIGN KEY (preserve_id)
        REFERENCES preserves (id)
);