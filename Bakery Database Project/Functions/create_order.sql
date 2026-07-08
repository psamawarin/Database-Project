CREATE OR REPLACE FUNCTION create_order(
    p_customer_id INT,
    p_branch_id INT,
    p_pickup_slot_id INT,
    p_fulfillment_method VARCHAR
) RETURNS INT AS $$
DECLARE
v_order_id INT;
BEGIN
SELECT COALESCE(MAX(order_id), 0) + 1 INTO v_order_id FROM "ORDER";

INSERT INTO "ORDER" (
    order_id, customer_id, branch_id, pickup_slot_id, order_date,
    status, subtotal, tax, total_amount, fulfillment_method, shipping_cost
) VALUES (
             v_order_id, p_customer_id, p_branch_id, p_pickup_slot_id, CURRENT_DATE,
             'Pending', 0, 0, 0, p_fulfillment_method, 0
         );

RETURN v_order_id;
END;
$$ LANGUAGE plpgsql;