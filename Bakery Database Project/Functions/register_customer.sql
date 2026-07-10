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
    INSERT INTO customer (first_name, last_name, email, password_hash, phone, created_at, last_login_at)
    VALUES (p_first_name, p_last_name, LOWER(p_email), p_password_hash, p_phone, NOW(), NULL)
    RETURNING customer_id INTO v_customer_id;

    RETURN v_customer_id;

EXCEPTION
    WHEN unique_violation THEN
        RAISE EXCEPTION 'Email: % is already registered', p_email;
END;
$$ LANGUAGE plpgsql;