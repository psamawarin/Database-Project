CREATE OR REPLACE FUNCTION deactivate_product(
    p_product_id INT
) RETURNS VOID AS $$
BEGIN
UPDATE PRODUCT SET is_active = FALSE WHERE product_id = p_product_id;
END;
$$ LANGUAGE plpgsql;