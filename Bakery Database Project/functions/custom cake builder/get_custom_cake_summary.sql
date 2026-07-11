CREATE OR REPLACE FUNCTION get_custom_cake_summary(
    p_custom_cake_id INT
) RETURNS TABLE (
                    custom_cake_id INT,
                    size_name VARCHAR,
                    shape_name VARCHAR,
                    cake_message VARCHAR,
                    special_instructions VARCHAR,
                    layers JSON,
                    decorations JSON,
                    addons JSON,
                    total_price DECIMAL
                ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            cc.custom_cake_id,
            cs.name,
            sh.name,
            cc.cake_message,
            cc.special_instructions,
            (SELECT COALESCE(JSON_AGG(JSON_BUILD_OBJECT(
                                              'layer_number', l.layer_number,
                                              'base', cb.name,
                                              'frosting', fr.name
                                      ) ORDER BY l.layer_number), '[]'::JSON)
             FROM CUSTOM_CAKE_LAYER l
                      LEFT JOIN CAKE_BASE cb ON cb.base_id = l.base_id
                      LEFT JOIN FROSTING fr ON fr.frosting_id = l.frosting_id
             WHERE l.custom_cake_id = cc.custom_cake_id),
            (SELECT COALESCE(JSON_AGG(JSON_BUILD_OBJECT(
                    'decoration', d.name, 'quantity', ccd.quantity
                                      )), '[]'::JSON)
             FROM CUSTOM_CAKE_DECORATION ccd
                      JOIN DECORATION d ON d.decoration_id = ccd.decoration_id
             WHERE ccd.custom_cake_id = cc.custom_cake_id),
            (SELECT COALESCE(JSON_AGG(JSON_BUILD_OBJECT(
                    'addon', a.name, 'quantity', cca.quantity
                                      )), '[]'::JSON)
             FROM CUSTOM_CAKE_ADDON cca
                      JOIN ADDON a ON a.addon_id = cca.addon_id
             WHERE cca.custom_cake_id = cc.custom_cake_id),
            calculate_custom_cake_price(cc.custom_cake_id)
        FROM CUSTOM_CAKE cc
                 LEFT JOIN CAKE_SIZE cs ON cs.size_id = cc.size_id
                 LEFT JOIN CAKE_SHAPE sh ON sh.cake_shape_id = cc.cake_shape_id
        WHERE cc.custom_cake_id = p_custom_cake_id;
END;
$$ LANGUAGE plpgsql;