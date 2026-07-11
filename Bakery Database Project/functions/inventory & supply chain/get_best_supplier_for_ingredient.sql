CREATE OR REPLACE FUNCTION get_best_supplier_for_ingredient(
    p_ingredient_id INT
) RETURNS TABLE (
    supplier_id INT,
    supplier_name VARCHAR,
    unit_price DECIMAL,
    lead_time INT,
    minimum_order_qty INT
) AS $$
BEGIN
RETURN QUERY
SELECT s.supplier_id, s.name, si.unit_price, si.lead_time, si.minimum_order_qty
FROM SUPPLIER_INGREDIENT si
         JOIN SUPPLIER s ON s.supplier_id = si.supplier_id
WHERE si.ingredient_id = p_ingredient_id
ORDER BY si.unit_price;
END;
$$ LANGUAGE plpgsql;