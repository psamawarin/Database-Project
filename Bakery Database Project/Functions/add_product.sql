CREATE OR REPLACE FUNCTION add_product(
    p_category_id INT,
    p_name VARCHAR,
    p_description VARCHAR,
    p_price DECIMAL
) RETURNS INT AS $$
DECLARE
v_product_id INT;
BEGIN
SELECT COALESCE(MAX(product_id), 0) + 1 INTO v_product_id FROM PRODUCT;

INSERT INTO PRODUCT (product_id, category_id, name, description, price, is_active)
VALUES (v_product_id, p_category_id, p_name, p_description, p_price, TRUE);

RETURN v_product_id;
END;
$$ LANGUAGE plpgsql;