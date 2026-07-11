CREATE OR REPLACE FUNCTION add_cake_layer(
    p_custom_cake_id INT,
    p_layer_number INT,
    p_base_id INT,
    p_frosting_id INT
) RETURNS VOID AS $$
BEGIN
    INSERT INTO CUSTOM_CAKE_LAYER (layer_number, custom_cake_id, frosting_id, base_id)
    VALUES (p_layer_number, p_custom_cake_id, p_frosting_id, p_base_id)
    ON CONFLICT (custom_cake_id, layer_number)
        DO UPDATE SET frosting_id = EXCLUDED.frosting_id, base_id = EXCLUDED.base_id;
END;
$$ LANGUAGE plpgsql;