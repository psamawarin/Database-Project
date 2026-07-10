CREATE OR REPLACE FUNCTION get_available_product_image()
RETURNS SETOF product_image AS
    $$
    BEGIN
    RETURN QUERY
        SELECT * FROM product_image WHERE product_image.product_id IN
        (SELECT product_id FROM product WHERE is_active=true);
    END;
    $$ LANGUAGE plpgsql;