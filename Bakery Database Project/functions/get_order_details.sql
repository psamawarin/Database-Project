CREATE OR REPLACE FUNCTION get_order_details(
    p_order_id INT,
    p_customer_id INT
)
    RETURNS TABLE (
                      out_order_item_id INT,
                      out_item_type VARCHAR,
                      out_quantity INT,
                      out_unit_price DECIMAL,
                      out_line_total DECIMAL,
                      out_product_or_cake_name VARCHAR
                  ) AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM customer_order
        WHERE order_id = p_order_id
          AND customer_id = p_customer_id
    ) THEN
        RAISE EXCEPTION 'Order % not found for customer %.',
            p_order_id, p_customer_id;
    END IF;

    RETURN QUERY
        SELECT
            oi.order_item_id,
            oi.item_type,
            oi.quantity,
            oi.unit_price,
            oi.quantity * oi.unit_price,
            COALESCE(p.name, 'Custom Cake')
        FROM order_item oi
                 JOIN customer_order o
                      ON o.order_id = oi.order_id
                 LEFT JOIN order_item_product oip
                           ON oip.order_item_id = oi.order_item_id
                 LEFT JOIN product p
                           ON p.product_id = oip.product_id
        WHERE oi.order_id = p_order_id
          AND o.customer_id = p_customer_id
        ORDER BY oi.order_item_id;
END;
$$ LANGUAGE plpgsql;