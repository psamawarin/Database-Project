CREATE OR REPLACE FUNCTION update_product_price(
    p_product_id INT,
    p_new_price NUMERIC(10,2)
)
RETURNS VOID AS $$
BEGIN
    IF p_new_price <= 0 THEN
        RAISE EXCEPTION 'Price must be greater than zero.';
END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM product
        WHERE product_id = p_product_id
    ) THEN
        RAISE EXCEPTION 'Product % does not exist.', p_product_id;
END IF;

UPDATE product
SET price = p_new_price
WHERE product_id = p_product_id;
END;
$$ LANGUAGE plpgsql;