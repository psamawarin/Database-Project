CREATE OR REPLACE FUNCTION get_low_stock_products(
    p_branch_id INT
) RETURNS TABLE (
    product_id INT,
    name VARCHAR,
    quantity_on_hand INT,
    reorder_level INT
) AS $$
BEGIN
RETURN QUERY
SELECT pi.product_id, pi.name, pi.quantity_on_hand, pi.reorder_level
FROM PRODUCT_INVENTORY pi
WHERE pi.branch_id = p_branch_id
  AND pi.quantity_on_hand < pi.reorder_level
ORDER BY pi.quantity_on_hand;
END;
$$ LANGUAGE plpgsql;