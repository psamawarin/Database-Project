CREATE OR REPLACE FUNCTION create_custom_cake(
    p_size_id INT,
    p_cake_shape_id INT,
    p_cake_message VARCHAR DEFAULT NULL,
    p_special_instructions VARCHAR DEFAULT NULL
) RETURNS INT AS $$
DECLARE
    v_custom_cake_id INT;
BEGIN
    SELECT COALESCE(MAX(custom_cake_id), 0) + 1 INTO v_custom_cake_id FROM CUSTOM_CAKE;

    INSERT INTO CUSTOM_CAKE (size_id, cake_shape_id, cake_message, special_instructions)
    VALUES (p_size_id, p_cake_shape_id, p_cake_message, p_special_instructions)
    RETURNING custom_cake_id INTO v_custom_cake_id;

    RETURN v_custom_cake_id;
END;
$$ LANGUAGE plpgsql;