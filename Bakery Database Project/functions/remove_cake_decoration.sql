CREATE OR REPLACE FUNCTION remove_cake_decoration(
    p_custom_cake_id INT,
    p_decoration_id INT
) RETURNS VOID AS $$
BEGIN
    DELETE FROM CUSTOM_CAKE_DECORATION
    WHERE custom_cake_id = p_custom_cake_id AND decoration_id = p_decoration_id;
END;
$$ LANGUAGE plpgsql;