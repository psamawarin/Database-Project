CREATE OR REPLACE FUNCTION get_customer_order_history(
    p_customer_id INT
) RETURNS TABLE (
    res_order_id INT,
    res_order_date DATE,
    res_status VARCHAR(50),
    res_total_amount DECIMAL(10,2),
    res_fulfillment_method VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY
        SELECT
            c.order_id,
            c.order_date,
            c.status,
            c.total_amount,
            c.fulfillment_method
        FROM customer_order AS c
        WHERE c.customer_id = p_customer_id
        ORDER BY c.order_date DESC;
END;
$$ LANGUAGE plpgsql;