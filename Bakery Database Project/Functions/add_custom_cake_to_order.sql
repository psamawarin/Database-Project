CREATE OR REPLACE FUNCTION add_custom_cake_to_order(
    p_order_id INT,
    p_custom_cake_id INT,
    p_quantity INT
) RETURNS INT AS $$
DECLARE
v_order_item_id INT;
    v_unit_price DECIMAL(10, 2);
BEGIN
    -- 1. Calculate the real-time price
    v_unit_price := calculate_custom_cake_price(p_custom_cake_id);

    -- 2. Insert into the parent table and instantly capture Postgres's auto-generated ID
INSERT INTO ORDER_ITEM (order_id, item_type, quantity, unit_price)
VALUES (p_order_id, 'custom_cake', p_quantity, v_unit_price)
    RETURNING order_item_id INTO v_order_item_id;

-- 3. Safely link to the child table using the captured ID
INSERT INTO ORDER_ITEM_CUSTOM_CAKE (order_item_id, custom_cake_id)
VALUES (v_order_item_id, p_custom_cake_id);

RETURN v_order_item_id;
END;
$$ LANGUAGE plpgsql;