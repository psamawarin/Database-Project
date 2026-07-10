CREATE OR REPLACE FUNCTION add_customer_address(
    p_customer_id INT,
    p_house_number VARCHAR,
    p_building VARCHAR,
    p_street VARCHAR,
    p_city VARCHAR,
    p_province VARCHAR,
    p_postal_code VARCHAR
) RETURNS INT AS $$
DECLARE
v_address_id INT;
BEGIN

    IF NOT EXISTS(
        SELECT 1
        FROM customer
        WHERE customer_id = p_customer_id
    ) THEN
        RAISE EXCEPTION 'User: % does not exist', p_customer_id;
END IF;

    IF EXISTS(
        SELECT 1
        FROM customer_address
        WHERE customer_id = p_customer_id
        AND house_number = p_house_number
        AND building IS NOT DISTINCT FROM p_building
        AND street = p_street
        AND city = p_city
        AND province = p_province
        AND postal_code = p_postal_code
    ) THEN
        RAISE EXCEPTION 'This address already exists for user';
END IF;

INSERT INTO CUSTOMER_ADDRESS (
    customer_id, house_number, building,
    street, city, province, postal_code
) VALUES (
             p_customer_id, p_house_number, p_building,
             p_street, p_city, p_province, p_postal_code
         ) RETURNING address_id INTO v_address_id;

RETURN v_address_id;
END;
$$ LANGUAGE plpgsql;