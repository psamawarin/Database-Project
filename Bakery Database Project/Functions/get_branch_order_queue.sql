CREATE OR REPLACE FUNCTION get_branch_order_queue(
    p_branch_id INT,
    p_date DATE DEFAULT CURRENT_DATE
) RETURNS TABLE (
                    order_id INT,
                    customer_name VARCHAR,
                    status VARCHAR,
                    fulfillment_method VARCHAR,
                    order_date DATE
                ) AS $$
BEGIN
    RETURN QUERY
        SELECT o.order_id,
               concat_ws(' ', c.first_name, c.last_name)::VARCHAR,
               o.status,
               o.fulfillment_method,
               o.order_date
        FROM customer_order o
                 JOIN CUSTOMER c ON c.customer_id = o.customer_id
        WHERE o.branch_id = p_branch_id
          AND o.order_date = p_date
          AND o.status NOT IN ('Completed', 'Cancelled')
        ORDER BY o.order_id;
END;
$$ LANGUAGE plpgsql;