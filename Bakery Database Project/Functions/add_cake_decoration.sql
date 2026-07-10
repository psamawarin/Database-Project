CREATE OR REPLACE FUNCTION add_cake_decoration(
    p_custom_cake_id INT,
    p_decoration_id INT,
    p_quantity INT DEFAULT 1
) RETURNS VOID AS $$
BEGIN
    INSERT INTO CUSTOM_CAKE_DECORATION (custom_cake_id, decoration_id, quantity)
    VALUES (p_custom_cake_id, p_decoration_id, p_quantity)
    ON CONFLICT (custom_cake_id, decoration_id)
        DO UPDATE SET quantity = EXCLUDED.quantity;
END;
$$ LANGUAGE plpgsql;