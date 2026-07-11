CREATE OR REPLACE FUNCTION get_login_customer(p_email VARCHAR)
RETURNS TABLE(customer_id INT, password_hash VARCHAR) AS $$
BEGIN
RETURN QUERY
SELECT c.customer_id, c.password_hash
FROM customer AS c
WHERE p_email = c.email;
END;
$$ LANGUAGE plpgsql;