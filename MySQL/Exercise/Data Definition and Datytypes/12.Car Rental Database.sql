CREATE TABLE categories (
    id INT NOT NULL AUTO_INCREMENT,
    category VARCHAR(255) NOT NULL,
    daily_rate DECIMAL(5 , 2 ),
    weekly_rate DECIMAL(5 , 2 ),
    monthly_rate DECIMAL(5 , 2 ),
    weekend_rate DECIMAL(5 , 2 ),
    PRIMARY KEY (id)
);

INSERT INTO categories (category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES
('idk1', NULL, NULL, NULL, NULL),
('idk2', NULL, NULL, NULL, NULL),
('idk3', NULL, NULL, NULL, NULL);

CREATE TABLE cars (
    id INT NOT NULL AUTO_INCREMENT,
    plate_number VARCHAR(255) NOT NULL,
    make VARCHAR(255),
    model VARCHAR(255),
    car_year YEAR,
    category_id INT NOT NULL,
    doors INT,
    picture BLOB,
    car_condition TEXT,
    available BOOLEAN,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id)
        REFERENCES categories (id)
);

INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, picture, car_condition, available) VALUES
('TT 1234 TT', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
('EE 4321 EE', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL),
('AA 0000 AA', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    title VARCHAR(255),
    notes TEXT,
    PRIMARY KEY (id)
);

INSERT INTO employees (first_name, last_name, title, notes) VALUES
('pow', 'pew', NULL, NULL),
('row', 'rew', NULL, NULL),
('vow', 'vew', NULL, NULL);

CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    driver_licence_number INT NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(255),
    zip_code VARCHAR(255),
    notes TEXT,
    PRIMARY KEY (id)
);

INSERT INTO customers (driver_licence_number, full_name, address, city, zip_code, notes) VALUES
(683963, 'Ri Ro Re', NULL, NULL, NULL, NULL),
(834692, 'Pi Po Pe', NULL, NULL, NULL, NULL),
(132553, 'Li Lo Le', NULL, NULL, NULL, NULL);


CREATE TABLE rental_orders (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    car_id INT NOT NULL,
    car_condition TEXT,
    tank_level VARCHAR(255),
    kilometrage_start INT,
    kilometrage_end INT,
    total_kilometrage INT,
    start_date DATE,
    end_date DATE,
    total_days INT,
    rate_applied DECIMAL(5 , 2 ),
    tax_rate DECIMAL(5 , 2 ),
    order_status VARCHAR(255),
    notes TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id)
        REFERENCES employees (id),
    FOREIGN KEY (customer_id)
        REFERENCES customers (id),
    FOREIGN KEY (car_id)
        REFERENCES cars (id)
);

INSERT INTO rental_orders (employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)