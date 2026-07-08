CREATE OR REPLACE FUNCTION register_customer (
    p_first_name VARCHAR,
    p_last_name VARCHAR,
    p_email VARCHAR,
    p_password_hash VARCHAR,
    p_phone VARCHAR
) RETURNS INT AS $$
DECLARE
v_customer_id INT;
BEGIN
    IF EXISTS( SELECT 1 FROM customer where email = p_email) THEN
        RAISE EXCEPTION 'Email: % is already registered', p_email;
END IF ;

INSERT INTO customer (first_name,last_name,email,password_hash,phone,created_at)
VALUES (p_first_name,p_last_name,p_email,p_password_hash,p_phone,CURRENT_DATE)
    RETURNING customer_id INTO v_customer_id;
RETURN v_customer_id;
END;
$$ LANGUAGE plpgsql