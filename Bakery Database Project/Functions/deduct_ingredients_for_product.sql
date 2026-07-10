CREATE OR REPLACE FUNCTION deduct_ingredients_for_product(
    p_branch_id INT,
    p_product_id INT,
    p_quantity_made INT
) RETURNS VOID AS $$
BEGIN
UPDATE INGREDIENT_INVENTORY ii
SET quantity_on_hand = ii.quantity_on_hand - (pi.quantity_required * p_quantity_made)
    FROM PRODUCT_INGREDIENT pi
WHERE pi.product_id = p_product_id
  AND ii.branch_id = p_branch_id
  AND ii.ingredient_id = pi.ingredient_id;
END;
$$ LANGUAGE plpgsql;