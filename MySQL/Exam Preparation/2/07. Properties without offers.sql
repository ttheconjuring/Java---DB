SELECT 
    SUBSTRING(address, 1, 6) AS agent_name,
    LENGTH(address) * 5430 AS price
FROM
    properties p
        LEFT JOIN
    property_offers po ON p.id = po.property_id
WHERE
    po.agent_id IS NULL
ORDER BY agent_name DESC , price DESC;
