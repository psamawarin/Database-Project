CREATE OR REPLACE FUNCTION calculate_custom_cake_price(
    p_custom_cake_id INT
) RETURNS DECIMAL(10, 2) AS $$
DECLARE
    v_total_price DECIMAL(10, 2) := 0;
BEGIN
    SELECT
        COALESCE(cs.price_modifier, 0) + COALESCE(sh.price, 0) +

        COALESCE((
                     SELECT SUM(COALESCE(cb.price, 0) + COALESCE(fr.price, 0))
                     FROM CUSTOM_CAKE_LAYER l
                              LEFT JOIN CAKE_BASE cb ON cb.base_id = l.base_id
                              LEFT JOIN FROSTING fr ON fr.frosting_id = l.frosting_id
                     WHERE l.custom_cake_id = cc.custom_cake_id
                 ), 0) +

        COALESCE((
                     SELECT SUM(d.price * ccd.quantity)
                     FROM CUSTOM_CAKE_DECORATION ccd
                              JOIN DECORATION d ON d.decoration_id = ccd.decoration_id
                     WHERE ccd.custom_cake_id = cc.custom_cake_id
                 ), 0) +

        COALESCE((
                     SELECT SUM(a.price * cca.quantity)
                     FROM CUSTOM_CAKE_ADDON cca
                              JOIN ADDON a ON a.addon_id = cca.addon_id
                     WHERE cca.custom_cake_id = cc.custom_cake_id
                 ), 0)

    INTO v_total_price
    FROM CUSTOM_CAKE cc
             LEFT JOIN CAKE_SIZE cs ON cs.size_id = cc.size_id
             LEFT JOIN CAKE_SHAPE sh ON sh.cake_shape_id = cc.cake_shape_id
    WHERE cc.custom_cake_id = p_custom_cake_id;

    RETURN COALESCE(v_total_price, 0);
END;
$$ LANGUAGE plpgsql;