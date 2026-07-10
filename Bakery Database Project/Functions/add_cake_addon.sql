CREATE OR REPLACE FUNCTION add_cake_addon(
    p_custom_cake_id INT,
    p_addon_id INT,
    p_quantity DECIMAL DEFAULT 1
) RETURNS VOID AS $$
BEGIN
    INSERT INTO CUSTOM_CAKE_ADDON (custom_cake_id, addon_id, quantity)
    VALUES (p_custom_cake_id, p_addon_id, p_quantity)
    ON CONFLICT (custom_cake_id, addon_id)
        DO UPDATE SET quantity = EXCLUDED.quantity;
END;
$$ LANGUAGE plpgsql;