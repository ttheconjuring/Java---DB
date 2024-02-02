CREATE PROCEDURE usp_get_holders_with_balance_higher_than(number DECIMAL(20,5))
BEGIN
	SELECT 
		first_name, last_name
	FROM
		account_holders ah
			JOIN
		accounts a ON ah.id = a.account_holder_id
	GROUP BY a.account_holder_id
	HAVING SUM(a.balance) > number
	ORDER BY a.account_holder_id;
END

