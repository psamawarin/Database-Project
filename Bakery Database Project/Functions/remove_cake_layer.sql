CREATE OR REPLACE FUNCTION remove_cake_layer(
    p_custom_cake_id INT,
    p_layer_number INT
) RETURNS VOID AS $$
BEGIN
    DELETE FROM CUSTOM_CAKE_LAYER
    WHERE custom_cake_id = p_custom_cake_id AND layer_number = p_layer_number;
END;
$$ LANGUAGE plpgsql;