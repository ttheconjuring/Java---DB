CREATE PROCEDURE udp_delay_flight(code VARCHAR(50))
BEGIN
	UPDATE flights 
	SET 
		has_delay = TRUE,
		departure = DATE_ADD(departure, INTERVAL 30 MINUTE)
	WHERE
		flight_code = code;
END



