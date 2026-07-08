CREATE OR REPLACE FUNCTION check_custom_cake_allergens(
    p_custom_cake_id INT,
    p_customer_id INT
) RETURNS TABLE (allergen_id INT, allergen_name VARCHAR) AS $$
BEGIN
RETURN QUERY
SELECT DISTINCT a.allergen_id, a.name
FROM CUSTOM_CAKE_LAYER l
         JOIN CAKE_BASE_INGREDIENT cbi ON cbi.base_id = l.base_id
         JOIN INGREDIENT_ALLERGEN ia1 ON ia1.ingredient_id = cbi.ingredient_id
         JOIN ALLERGEN a ON a.allergen_id = ia1.allergen_id
         JOIN CUSTOMER_ALLERGEN ca1 ON ca1.allergen_id = a.allergen_id AND ca1.customer_id = p_customer_id
WHERE l.custom_cake_id = p_custom_cake_id

UNION

SELECT DISTINCT a.allergen_id, a.name
FROM CUSTOM_CAKE_LAYER l
         JOIN FROSTING_INGREDIENT fi ON fi.frosting_id = l.frosting_id
         JOIN INGREDIENT_ALLERGEN ia2 ON ia2.ingredient_id = fi.ingredient_id
         JOIN ALLERGEN a ON a.allergen_id = ia2.allergen_id
         JOIN CUSTOMER_ALLERGEN ca2 ON ca2.allergen_id = a.allergen_id AND ca2.customer_id = p_customer_id
WHERE l.custom_cake_id = p_custom_cake_id;
END;
$$ LANGUAGE plpgsql;