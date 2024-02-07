INSERT INTO airplanes (model, passengers_capacity, tank_capacity, cost)
SELECT 
	CONCAT(REVERSE(first_name), '797') AS model,
    LENGTH(last_name) * 17 AS passengers_capacity,
    id * 790 AS tank_capacity,
    LENGTH(first_name) * 50.6 AS cost
FROM passengers
WHERE id <= 5;