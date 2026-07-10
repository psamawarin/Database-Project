CREATE OR REPLACE FUNCTION remove_cake_addon(
    p_custom_cake_id INT,
    p_addon_id INT
) RETURNS VOID AS $$
BEGIN
    DELETE FROM CUSTOM_CAKE_ADDON
    WHERE custom_cake_id = p_custom_cake_id AND addon_id = p_addon_id;
END;
$$ LANGUAGE plpgsql;