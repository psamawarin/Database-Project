DROP TABLE IF EXISTS INGREDIENT_ALLERGEN CASCADE;
DROP TABLE IF EXISTS SUPPLIER_INGREDIENT  CASCADE;
DROP TABLE IF EXISTS FROSTING_INGREDIENT  CASCADE;
DROP TABLE IF EXISTS CAKE_BASE_INGREDIENT CASCADE;
DROP TABLE IF EXISTS PRODUCT_INGREDIENT CASCADE;
DROP TABLE IF EXISTS PRODUCT_INVENTORY CASCADE;
DROP TABLE IF EXISTS INGREDIENT_INVENTORY CASCADE;
DROP TABLE IF EXISTS CUSTOMER_ALLERGEN CASCADE;
DROP TABLE IF EXISTS CUSTOMER_ADDRESS CASCADE;
DROP TABLE IF EXISTS CUSTOMER_ORDER CASCADE;
DROP TABLE IF EXISTS PICKUP_SLOT CASCADE;
DROP TABLE IF EXISTS PRODUCT_IMAGE CASCADE;
DROP TABLE IF EXISTS CUSTOM_CAKE_LAYER CASCADE;
DROP TABLE IF EXISTS CUSTOM_CAKE_DECORATION CASCADE;
DROP TABLE IF EXISTS CUSTOM_CAKE_ADDON CASCADE;
DROP TABLE IF EXISTS CUSTOM_CAKE CASCADE;
DROP TABLE IF EXISTS ORDER_ITEM_PRODUCT CASCADE;
DROP TABLE IF EXISTS ORDER_ITEM_CUSTOM_CAKE CASCADE;
DROP TABLE IF EXISTS ORDER_ITEM CASCADE;
DROP TABLE IF EXISTS PAYMENT CASCADE;
DROP TABLE IF EXISTS DELIVERY CASCADE;
DROP TABLE IF EXISTS "CUSTOMER_ORDER" CASCADE;
DROP TABLE IF EXISTS PRODUCT CASCADE;
DROP TABLE IF EXISTS CATEGORY CASCADE;
DROP TABLE IF EXISTS BRANCH CASCADE;
DROP TABLE IF EXISTS CUSTOMER CASCADE;
DROP TABLE IF EXISTS SUPPLIER CASCADE;
DROP TABLE IF EXISTS INGREDIENT CASCADE;
DROP TABLE IF EXISTS ALLERGEN CASCADE;
DROP TABLE IF EXISTS FROSTING CASCADE;
DROP TABLE IF EXISTS CAKE_BASE CASCADE;
DROP TABLE IF EXISTS ADDON CASCADE;
DROP TABLE IF EXISTS DECORATION CASCADE;
DROP TABLE IF EXISTS CAKE_SIZE CASCADE;
DROP TABLE IF EXISTS CAKE_SHAPE CASCADE;

-- ============================================================
-- INDEPENDENT TABLES
-- ============================================================

CREATE TABLE CAKE_SHAPE (
    cake_shape_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE CAKE_SIZE (
    size_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    diameter INT NOT NULL,
    servings INT NOT NULL,
    price_modifier DECIMAL(10, 2) NOT NULL
);

CREATE TABLE DECORATION (
    decoration_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE ADDON (
    addon_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE CAKE_BASE (
    base_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE FROSTING (
    frosting_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE ALLERGEN (
    allergen_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL
);

CREATE TABLE INGREDIENT (
    ingredient_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    unit_of_measure VARCHAR(50) NOT NULL,
    is_active BOOLEAN NOT NULL
);

CREATE TABLE SUPPLIER (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE CUSTOMER (
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    created_at DATE NOT NULL,
    email_verified BOOLEAN DEFAULT FALSE,
    last_login_at TIMESTAMP
);

CREATE TABLE CATEGORY (
    category_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE BRANCH (
    branch_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    opening_hours VARCHAR(255) NOT NULL,
    daily_cake_capacity INT NOT NULL,
    daily_order_limit INT NOT NULL
);

-- ============================================================
-- FIRST-LEVEL DEPENDENCIES
-- ============================================================

CREATE TABLE PRODUCT (
    product_id INT PRIMARY KEY,
    category_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    is_active BOOLEAN NOT NULL,
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
);

CREATE TABLE PRODUCT_IMAGE (
     image_id INT PRIMARY KEY,
     product_id INT NOT NULL,
     url VARCHAR(255) NOT NULL,
    display_order INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

CREATE TABLE CUSTOMER_ADDRESS (
    address_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT NOT NULL,
    house_number VARCHAR(100) NOT NULL,
    building VARCHAR(255),
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);

CREATE TABLE PICKUP_SLOT (
    pickup_slot_id INT PRIMARY KEY,
    branch_id INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    capacity INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id)
);

CREATE TABLE CUSTOMER_ALLERGEN (
    customer_id INT NOT NULL,
    allergen_id INT NOT NULL,
    PRIMARY KEY (customer_id, allergen_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (allergen_id) REFERENCES ALLERGEN(allergen_id)
);

CREATE TABLE INGREDIENT_ALLERGEN (
    ingredient_id INT NOT NULL,
    allergen_id INT NOT NULL,
    PRIMARY KEY (ingredient_id, allergen_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id),
    FOREIGN KEY (allergen_id) REFERENCES ALLERGEN(allergen_id)
);

CREATE TABLE SUPPLIER_INGREDIENT (
    supplier_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    lead_time INT NOT NULL,
    minimum_order_qty INT NOT NULL,
    last_updated DATE NOT NULL,
    PRIMARY KEY (supplier_id, ingredient_id),
    FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

CREATE TABLE FROSTING_INGREDIENT (
    frosting_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (frosting_id, ingredient_id),
    FOREIGN KEY (frosting_id) REFERENCES FROSTING(frosting_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

CREATE TABLE CAKE_BASE_INGREDIENT (
    base_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (base_id, ingredient_id),
    FOREIGN KEY (base_id) REFERENCES CAKE_BASE(base_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

CREATE TABLE PRODUCT_INGREDIENT (
    product_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity_required DECIMAL(10, 2) NOT NULL,
    unit_of_measure VARCHAR(50) NOT NULL,
    PRIMARY KEY (product_id, ingredient_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

CREATE TABLE PRODUCT_INVENTORY (
    branch_id INT NOT NULL,
    product_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    quantity_on_hand INT NOT NULL,
    is_active BOOLEAN NOT NULL,
    reorder_level INT DEFAULT 5,
    PRIMARY KEY (branch_id, product_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

CREATE TABLE INGREDIENT_INVENTORY (
    branch_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    quantity_on_hand INT NOT NULL,
    is_active BOOLEAN NOT NULL,
    reorder_level INT DEFAULT 100,
    PRIMARY KEY (branch_id, ingredient_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

-- ============================================================
-- ORDERS & FULFILLMENT
-- ============================================================

CREATE TABLE CUSTOMER_ORDER (
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    pickup_slot_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL CHECK
        (status IN
         ('Pending', 'Confirmed', 'In Production', 'Ready', 'Completed', 'Cancelled')
        ),
    subtotal DECIMAL(10, 2) NOT NULL,
    tax DECIMAL(10, 2) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    fulfillment_method VARCHAR(50) NOT NULL,
    shipping_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id),
    FOREIGN KEY (pickup_slot_id) REFERENCES PICKUP_SLOT(pickup_slot_id)
);

CREATE TABLE PAYMENT (
    payment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    paid_at DATE,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Pending', 'Paid', 'Failed', 'Refunded')),
    FOREIGN KEY (order_id) REFERENCES CUSTOMER_ORDER (order_id)
);

CREATE TABLE DELIVERY (
    delivery_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INT NOT NULL,
    address_id INT NOT NULL,
    driver VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Pending', 'Out for Delivery', 'Delivered', 'Failed')),
    estimated_delivery_time TIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES CUSTOMER_ORDER (order_id),
    FOREIGN KEY (address_id) REFERENCES CUSTOMER_ADDRESS(address_id)
);

CREATE TABLE ORDER_ITEM (
    order_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INT,
    item_type VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES CUSTOMER_ORDER (order_id)
);

CREATE TABLE ORDER_ITEM_PRODUCT (
    order_item_id INT PRIMARY KEY,
    product_id INT,
    FOREIGN KEY (order_item_id) REFERENCES ORDER_ITEM(order_item_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

CREATE TABLE ORDER_ITEM_CUSTOM_CAKE (
    order_item_id INT PRIMARY KEY,
    custom_cake_id INT,
    FOREIGN KEY (order_item_id) REFERENCES ORDER_ITEM(order_item_id)
); -- Add custom_cake_id key bellow


-- ============================================================
-- CAKE CUSTOMIZATION
-- ============================================================


CREATE TABLE CUSTOM_CAKE (
    custom_cake_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    size_id INT,
    cake_shape_id INT,
    cake_message VARCHAR(255),
    special_instructions VARCHAR(255),
    FOREIGN KEY (size_id) REFERENCES CAKE_SIZE(size_id),
    FOREIGN KEY (cake_shape_id) REFERENCES CAKE_SHAPE(cake_shape_id)
);

ALTER TABLE ORDER_ITEM_CUSTOM_CAKE
    ADD FOREIGN KEY (custom_cake_id) REFERENCES CUSTOM_CAKE(custom_cake_id);
-- Add foreign key constraint to ORDER_ITEM_CUSTOM_CAKE

CREATE TABLE CUSTOM_CAKE_DECORATION (
    custom_cake_id INT,
    decoration_id INT,
    quantity INT,
    PRIMARY KEY (custom_cake_id, decoration_id),
    FOREIGN KEY (custom_cake_id) REFERENCES CUSTOM_CAKE(custom_cake_id),
    FOREIGN KEY (decoration_id) REFERENCES DECORATION(decoration_id)
);

CREATE TABLE CUSTOM_CAKE_ADDON (
    custom_cake_id INT,
    addon_id INT,
    quantity DECIMAL(10, 2),
    PRIMARY KEY (custom_cake_id, addon_id),
    FOREIGN KEY (custom_cake_id) REFERENCES CUSTOM_CAKE(custom_cake_id),
    FOREIGN KEY (addon_id) REFERENCES ADDON(addon_id)
);

CREATE TABLE CUSTOM_CAKE_LAYER (
    layer_number INT,
    custom_cake_id INT,
    frosting_id INT,
    base_id INT,
    PRIMARY KEY (custom_cake_id, layer_number),
    FOREIGN KEY (custom_cake_id) REFERENCES CUSTOM_CAKE(custom_cake_id),
    FOREIGN KEY (frosting_id) REFERENCES FROSTING(frosting_id),
    FOREIGN KEY (base_id) REFERENCES CAKE_BASE(base_id)
);