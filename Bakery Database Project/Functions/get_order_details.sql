CREATE OR REPLACE FUNCTION get_order_details(
    p_order_id INT,
    p_customer_id INT
) RETURNS TABLE (
    out_order_item_id INT,
    out_item_type VARCHAR,
    out_quantity INT,
    out_unit_price DECIMAL,
    out_line_total DECIMAL,
    out_product_or_cake_name VARCHAR
) AS $$
BEGIN
    RETURN QUERY
        SELECT
            oi.order_item_id,
            oi.item_type,
            oi.quantity,
            oi.unit_price,
            (oi.quantity * oi.unit_price)::DECIMAL AS line_total,
            COALESCE(p.name, 'Custom Cake')::VARCHAR AS product_or_cake_name
        FROM ORDER_ITEM oi
                 JOIN "ORDER" o ON o.order_id = oi.order_id
                 LEFT JOIN ORDER_ITEM_PRODUCT oip ON oip.order_item_id = oi.order_item_id
                 LEFT JOIN PRODUCT p ON p.product_id = oip.product_id
        WHERE oi.order_id = p_order_id
          AND o.customer_id = p_customer_id;
END;
$$ LANGUAGE plpgsql;