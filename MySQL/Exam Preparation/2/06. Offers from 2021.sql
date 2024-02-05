SELECT 
    property_id, agent_id, price, offer_datetime
FROM
    property_offers
WHERE
    EXTRACT(YEAR FROM offer_datetime) = 2021
ORDER BY price
LIMIT 10;