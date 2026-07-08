CREATE OR REPLACE FUNCTION cancel_order(
    p_order_id INT,
    p_customer_id INT
) RETURNS BOOLEAN AS $$
DECLARE
    v_status VARCHAR(50);
BEGIN
    SELECT status
    INTO v_status
    FROM "ORDER"
    WHERE order_id = p_order_id
      AND customer_id = p_customer_id;

    IF v_status IS NULL THEN
        RAISE EXCEPTION 'Order % not found for this customer.', p_order_id;
    END IF;

    IF v_status NOT IN ('Pending', 'Confirmed') THEN
        RETURN FALSE;
    END IF;

    UPDATE "ORDER"
    SET status = 'Cancelled'
    WHERE order_id = p_order_id
      AND customer_id = p_customer_id;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;