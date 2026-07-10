CREATE OR REPLACE FUNCTION update_order_status(
    p_order_id INT,
    p_new_status VARCHAR
) RETURNS VOID AS $$
BEGIN
    IF p_new_status NOT IN ('Pending', 'Confirmed', 'In Production', 'Ready', 'Completed', 'Cancelled') THEN
        RAISE EXCEPTION 'Invalid status: %', p_new_status;
END IF;

UPDATE customer_order SET status = p_new_status WHERE order_id = p_order_id;

IF NOT FOUND THEN
        RAISE EXCEPTION 'Order % not found', p_order_id;
END IF;
END;
$$ LANGUAGE plpgsql;