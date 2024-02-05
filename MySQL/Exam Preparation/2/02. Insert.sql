INSERT INTO property_transactions (property_id, buyer_id, transaction_date, bank_name, iban, is_successful)
SELECT 
    agent_id + EXTRACT(DAY FROM offer_datetime) AS property_id,
    agent_id + EXTRACT(MONTH FROM offer_datetime) AS buyer_id,
    DATE(offer_datetime) AS transaction_date,
    CONCAT('Bank ', agent_id) AS bank_name,
    CONCAT('BG', price, agent_id) AS iban,
    TRUE AS is_successful
FROM
    property_offers
WHERE
    agent_id <= 2;