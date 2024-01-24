SELECT 
    driver_id,
    vehicle_type,
    CONCAT(first_name, ' ', last_name) AS 'driver_name'
FROM
    campers
        JOIN
    vehicles ON campers.id = vehicles.driver_id;