CREATE OR REPLACE FUNCTION get_top_selling_products(
    p_start_date DATE,
    p_end_date DATE,
    p_limit INT DEFAULT 5
) RETURNS TABLE (
    product_id INT,
    product_name VARCHAR,
    total_quantity_sold BIGINT
) AS $$
BEGIN
RETURN QUERY
SELECT p.product_id, p.name, SUM(oi.quantity)
FROM ORDER_ITEM oi
         JOIN ORDER_ITEM_PRODUCT oip ON oip.order_item_id = oi.order_item_id
         JOIN PRODUCT p ON p.product_id = oip.product_id
         JOIN customer_order as c ON c.order_id = oi.order_id
WHERE c.order_date BETWEEN p_start_date AND p_end_date
  AND c.status != 'Cancelled'
GROUP BY p.product_id, p.name
ORDER BY SUM(oi.quantity) DESC
    LIMIT p_limit;
END;
$$ LANGUAGE plpgsql;