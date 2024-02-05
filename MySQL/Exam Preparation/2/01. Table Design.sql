CREATE TABLE cities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE agents (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    city_id INT,
    CONSTRAINT fk_city_id_1 FOREIGN KEY (city_id)
        REFERENCES cities (id)
);

CREATE TABLE buyers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    city_id INT,
    CONSTRAINT fk_city_id_2 FOREIGN KEY (city_id)
        REFERENCES cities (id)
);

CREATE TABLE property_types (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(40) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE properties (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(80) NOT NULL UNIQUE,
    price DECIMAL(19 , 2 ) NOT NULL,
    area DECIMAL(19 , 2 ),
    property_type_id INT,
    city_id INT,
    CONSTRAINT fk_property_type_id FOREIGN KEY (property_type_id)
        REFERENCES property_types (id),
    CONSTRAINT fk_city_id_3 FOREIGN KEY (city_id)
        REFERENCES cities (id)
);

CREATE TABLE property_offers (
    property_id INT NOT NULL,
    agent_id INT NOT NULL,
    price DECIMAL(19 , 2 ) NOT NULL,
    offer_datetime DATETIME,
    CONSTRAINT fk_property_id_1 FOREIGN KEY (property_id)
        REFERENCES properties (id),
    CONSTRAINT fk_agent_id FOREIGN KEY (agent_id)
        REFERENCES agents (id)
);

CREATE TABLE property_transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT NOT NULL,
    buyer_id INT NOT NULL,
    transaction_date DATE,
    bank_name VARCHAR(30),
    iban VARCHAR(40) UNIQUE,
    is_successful TINYINT(1),
    CONSTRAINT fk_property_id_2 FOREIGN KEY (property_id)
        REFERENCES properties (id),
    CONSTRAINT fk_buyer_id FOREIGN KEY (buyer_id)
        REFERENCES buyers (id)
);
