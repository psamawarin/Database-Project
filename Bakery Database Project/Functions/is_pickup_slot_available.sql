CREATE OR REPLACE FUNCTION is_pickup_slot_available(
    p_pickup_slot_id INT
) RETURNS BOOLEAN AS $$
DECLARE
    v_capacity INT;
    v_booked INT;
BEGIN
    SELECT capacity INTO v_capacity FROM PICKUP_SLOT WHERE pickup_slot_id = p_pickup_slot_id;

    SELECT COUNT(*) INTO v_booked
    FROM customer_order
    WHERE pickup_slot_id = p_pickup_slot_id
      AND status NOT IN ('Cancelled');

    RETURN v_booked < v_capacity;
END;
$$ LANGUAGE plpgsql;