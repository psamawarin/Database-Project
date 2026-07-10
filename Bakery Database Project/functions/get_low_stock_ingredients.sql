CREATE OR REPLACE FUNCTION get_low_stock_ingredients(
    p_branch_id INT
) RETURNS TABLE (
    ingredient_id INT,
    name VARCHAR,
    quantity_on_hand INT,
    reorder_level INT
) AS $$
BEGIN
RETURN QUERY
SELECT ii.ingredient_id, ii.name, ii.quantity_on_hand, ii.reorder_level
FROM INGREDIENT_INVENTORY ii
WHERE ii.branch_id = p_branch_id
  AND ii.quantity_on_hand < ii.reorder_level
ORDER BY ii.quantity_on_hand;
END;
$$ LANGUAGE plpgsql;