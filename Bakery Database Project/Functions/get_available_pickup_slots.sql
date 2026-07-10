CREATE OR REPLACE FUNCTION get_available_pickup_slots(
    p_branch_id INT,
    p_date DATE,
    p_include_full BOOLEAN DEFAULT FALSE
) RETURNS TABLE (
                    pickup_slot_id INT,
                    date DATE,
                    "time" TIME,
                    capacity INT,
                    booked_count BIGINT,
                    remaining_capacity BIGINT
                ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            ps.pickup_slot_id,
            ps.date,
            ps."time",
            ps.capacity,
            COUNT(c.order_id) AS booked_count,
            (ps.capacity - COUNT(c.order_id)) AS remaining_capacity
        FROM PICKUP_SLOT ps
                 LEFT JOIN customer_order c
                           ON c.pickup_slot_id = ps.pickup_slot_id
                               AND c.status != 'Cancelled'
        WHERE ps.branch_id = p_branch_id
          AND ps.date = p_date
        GROUP BY ps.pickup_slot_id, ps.date, ps."time", ps.capacity
        HAVING p_include_full OR (ps.capacity - COUNT(c.order_id)) > 0
        ORDER BY ps."time";
END;
$$ LANGUAGE plpgsql;