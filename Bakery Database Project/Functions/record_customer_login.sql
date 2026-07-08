CREATE OR REPLACE FUNCTION record_customer_login(
    p_customer_id INT
) RETURNS VOID AS $$
BEGIN
UPDATE customer
SET last_login_at = CURRENT_TIMESTAMP
WHERE customer_id = p_customer_id;
END;
$$ LANGUAGE plpgsql;