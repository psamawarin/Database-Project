CREATE OR REPLACE FUNCTION restock_product(
    p_branch_id INT,
    p_product_id INT,
    p_quantity_added INT
) RETURNS VOID AS $$
BEGIN
UPDATE PRODUCT_INVENTORY
SET quantity_on_hand = quantity_on_hand + p_quantity_added
WHERE branch_id = p_branch_id AND product_id = p_product_id;

IF NOT FOUND THEN
        INSERT INTO PRODUCT_INVENTORY (branch_id, product_id, name, quantity_on_hand, is_active, reorder_level)
SELECT p_branch_id, p_product_id, p.name, p_quantity_added, TRUE, 5
FROM PRODUCT p WHERE p.product_id = p_product_id;
END IF;
END;
$$ LANGUAGE plpgsql;