CREATE OR REPLACE FUNCTION finalize_order(
    p_order_id INT,
    p_tax_rate DECIMAL DEFAULT 0.07,
    p_shipping_cost DECIMAL DEFAULT 0
) RETURNS VOID AS $$
DECLARE
    v_subtotal DECIMAL(10, 2);
    v_rows_updated INT;
BEGIN

    IF p_tax_rate < 0 THEN
        RAISE EXCEPTION 'Tax rate cannot be negative.';
    END IF;

    IF p_shipping_cost < 0 THEN
        RAISE EXCEPTION 'Shipping cost cannot be negative.';
    END IF;

    SELECT SUM(quantity * unit_price)
    INTO v_subtotal
    FROM order_item
    WHERE order_id = p_order_id;

    IF v_subtotal IS NULL THEN
        RAISE EXCEPTION 'Order % is empty or does not exist in order_items', p_order_id;
    END IF;

    UPDATE customer_order
    SET subtotal = v_subtotal,
        tax = ROUND(v_subtotal * p_tax_rate, 2),
        shipping_cost = p_shipping_cost,
        total_amount = ROUND((v_subtotal + p_shipping_cost) * (1 + p_tax_rate), 2),
        status = 'Confirmed'
    WHERE order_id = p_order_id;

    GET DIAGNOSTICS v_rows_updated = ROW_COUNT;

    IF v_rows_updated = 0 THEN
        RAISE EXCEPTION 'Order % does not exist', p_order_id;
    END IF;

END;
$$ LANGUAGE plpgsql;