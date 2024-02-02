CREATE FUNCTION ufn_calculate_future_value(sum DECIMAL(19,4), yearly_interest_rate DOUBLE, number_of_years INT) RETURNS DECIMAL (19, 4)
DETERMINISTIC
BEGIN
	DECLARE result DECIMAL (19,4);
	SET result := (sum * POW((1 + yearly_interest_rate), number_of_years));
	RETURN result;
END