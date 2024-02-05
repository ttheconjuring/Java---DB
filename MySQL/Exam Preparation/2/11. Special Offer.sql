CREATE PROCEDURE udp_special_offer(first_name VARCHAR(50))
BEGIN
	UPDATE property_offers po
			JOIN
		agents a ON po.agent_id = a.id 
	SET 
		price = price - (price * 0.1)
	WHERE
		a.first_name = first_name;
END


