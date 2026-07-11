CREATE OR REPLACE FUNCTION add_product_to_order(
    p_order_id INT,
    p_product_id INT,
    p_quantity INT
) RETURNS INT AS $$
DECLARE
    v_order_item_id INT;
    v_unit_price DECIMAL(10, 2);
BEGIN
    IF p_quantity <= 0 THEN
        RAISE EXCEPTION 'Quantity must be more than 0.';
    END IF;

    IF NOT EXISTS(
        SELECT 1
        FROM customer_order
        WHERE order_id = p_order_id
    ) THEN
        RAISE EXCEPTION 'Order % does not exists', p_order_id;
    END IF;

    SELECT price
    INTO v_unit_price
    FROM product
    WHERE product_id = p_product_id;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Product % does not exists', p_product_id;
    END IF;

    INSERT INTO ORDER_ITEM (order_id, item_type, quantity, unit_price)
    VALUES ( p_order_id, 'product', p_quantity, v_unit_price)
    RETURNING order_item_id INTO v_order_item_id;

    INSERT INTO order_item_product (order_item_id,product_id)
    VALUES (v_order_item_id,p_product_id);

RETURN v_order_item_id;
END;
$$ LANGUAGE plpgsql;