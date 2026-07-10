CREATE OR REPLACE FUNCTION restock_ingredient(
    p_branch_id INT,
    p_ingredient_id INT,
    p_quantity_added INT
) RETURNS VOID AS $$
BEGIN
UPDATE INGREDIENT_INVENTORY
SET quantity_on_hand = quantity_on_hand + p_quantity_added
WHERE branch_id = p_branch_id AND ingredient_id = p_ingredient_id;

IF NOT FOUND THEN
        INSERT INTO INGREDIENT_INVENTORY (branch_id, ingredient_id, name, quantity_on_hand, is_active, reorder_level)
SELECT p_branch_id, p_ingredient_id, i.name, p_quantity_added, TRUE, 1000
FROM INGREDIENT i WHERE i.ingredient_id = p_ingredient_id;
END IF;
END;
$$ LANGUAGE plpgsql;