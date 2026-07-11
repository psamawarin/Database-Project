CREATE OR REPLACE FUNCTION register_customer (
    p_first_name VARCHAR,
    p_last_name VARCHAR,
    p_email VARCHAR,
    p_password_hash VARCHAR,
    p_phone VARCHAR
) RETURNS INT AS $$
DECLARE
    v_user_id INT;
    v_customer_id INT;
BEGIN
    INSERT INTO "user"(email, password_hash, created_at, email_verified, last_login_at)
    VALUES (LOWER(p_email), p_password_hash, CURRENT_DATE, FALSE, NULL)
    RETURNING user_id INTO v_user_id;

    INSERT INTO customer (first_name, last_name, phone, user_id)
    VALUES (p_first_name, p_last_name, p_phone, v_user_id)
    RETURNING customer_id INTO v_customer_id;

    RETURN v_customer_id;

EXCEPTION
    WHEN unique_violation THEN
        RAISE EXCEPTION 'Email: % is already registered', p_email;
END;
$$ LANGUAGE plpgsql;

