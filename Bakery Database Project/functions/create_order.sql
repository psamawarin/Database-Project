CREATE OR REPLACE FUNCTION create_order(
    p_customer_id INT,
    p_branch_id INT,
    p_pickup_slot_id INT,
    p_fulfillment_method VARCHAR
) RETURNS INT AS $$
DECLARE
    v_order_id INT;
    v_capacity INT;
    v_booked INT;
BEGIN
    IF p_pickup_slot_id IS NOT NULL THEN

        SELECT capacity INTO v_capacity
        FROM PICKUP_SLOT
        WHERE pickup_slot_id = p_pickup_slot_id
            FOR UPDATE;

        IF v_capacity IS NULL THEN
            RAISE EXCEPTION 'Pickup slot % not found', p_pickup_slot_id;
        END IF;

        SELECT COUNT(*) INTO v_booked
        FROM customer_order
        WHERE pickup_slot_id = p_pickup_slot_id
          AND status NOT IN ('Cancelled');

        IF v_booked >= v_capacity THEN
            RAISE EXCEPTION 'Pickup slot % is fully booked', p_pickup_slot_id;
        END IF;
    END IF;

    INSERT INTO customer_order(
         customer_id, branch_id, pickup_slot_id, order_date,
        status, subtotal, tax, total_amount, fulfillment_method, shipping_cost
    ) VALUES (
                  p_customer_id, p_branch_id, p_pickup_slot_id, CURRENT_DATE,
                 'Pending', 0, 0, 0, p_fulfillment_method, 0
             ) RETURNING order_id INTO v_order_id;

    RETURN v_order_id;
END;
$$ LANGUAGE plpgsql;