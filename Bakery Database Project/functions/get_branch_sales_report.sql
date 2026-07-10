CREATE OR REPLACE FUNCTION get_branch_sales_report(
    p_branch_id INT,
    p_start_date DATE,
    p_end_date DATE
) RETURNS TABLE (
    total_orders INT,
    total_revenue DECIMAL,
    average_order_value DECIMAL
) AS $$
BEGIN
RETURN QUERY
SELECT
    COUNT(*)::INT,
    COALESCE(SUM(total_amount), 0),
    COALESCE(AVG(total_amount), 0)
FROM customer_orders
WHERE branch_id = p_branch_id
  AND order_date BETWEEN p_start_date AND p_end_date
  AND status != 'Cancelled';
END;
$$ LANGUAGE plpgsql;