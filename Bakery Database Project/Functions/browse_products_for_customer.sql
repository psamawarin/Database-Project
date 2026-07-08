CREATE OR REPLACE FUNCTION browse_products_for_customer(
    p_customer_id INT,
    p_category_id INT DEFAULT NULL
) RETURNS TABLE (
                    out_product_id INT,
                    out_name VARCHAR,
                    out_description VARCHAR,
                    out_price DECIMAL,
                    out_is_allergen_conflict BOOLEAN
                ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            p.product_id,
            p.name,
            p.description,
            p.price,
            EXISTS (
                SELECT 1
                FROM PRODUCT_INGREDIENT pi
                         JOIN INGREDIENT_ALLERGEN ia ON ia.ingredient_id = pi.ingredient_id
                         JOIN CUSTOMER_ALLERGEN ca ON ca.allergen_id = ia.allergen_id
                WHERE pi.product_id = p.product_id
                  AND ca.customer_id = p_customer_id
            ) AS is_allergen_conflict
        FROM PRODUCT p
        WHERE p.is_active = TRUE
          AND (p_category_id IS NULL OR p.category_id = p_category_id)
        ORDER BY p.name;
END;
$$ LANGUAGE plpgsql;