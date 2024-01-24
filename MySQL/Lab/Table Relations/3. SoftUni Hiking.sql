SELECT 
    starting_point AS 'route_starting_point',
    end_point AS 'route_ending-point',
    leader_id,
    CONCAT(first_name, ' ', last_name) AS 'leader_name'
FROM
    routes
        JOIN
    campers ON routes.leader_id = campers.id;