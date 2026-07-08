DROP TABLE IF EXISTS INGREDIENT_ALLERGEN;
DROP TABLE IF EXISTS SUPPLIER_INGREDIENT;
DROP TABLE IF EXISTS FROSTING_INGREDIENT;
DROP TABLE IF EXISTS CAKE_BASE_INGREDIENT;
DROP TABLE IF EXISTS PRODUCT_INGREDIENT;
DROP TABLE IF EXISTS PRODUCT_INVENTORY;
DROP TABLE IF EXISTS INGREDIENT_INVENTORY;
DROP TABLE IF EXISTS CUSTOMER_ALLERGEN;
DROP TABLE IF EXISTS CUSTOMER_ADDRESS;
DROP TABLE IF EXISTS PICKUP_SLOT;
DROP TABLE IF EXISTS PRODUCT_IMAGE;
DROP TABLE IF EXISTS CUSTOM_CAKE_LAYER;
DROP TABLE IF EXISTS CUSTOM_CAKE_DECORATION;
DROP TABLE IF EXISTS CUSTOM_CAKE_ADDON;
DROP TABLE IF EXISTS CUSTOM_CAKE;
DROP TABLE IF EXISTS ORDER_ITEM_PRODUCT;
DROP TABLE IF EXISTS ORDER_ITEM_CUSTOM_CAKE;
DROP TABLE IF EXISTS ORDER_ITEM;
DROP TABLE IF EXISTS PAYMENT;
DROP TABLE IF EXISTS DELIVERY;
DROP TABLE IF EXISTS "ORDER";
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS CATEGORY;
DROP TABLE IF EXISTS BRANCH;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS SUPPLIER;
DROP TABLE IF EXISTS INGREDIENT;
DROP TABLE IF EXISTS ALLERGEN;
DROP TABLE IF EXISTS FROSTING;
DROP TABLE IF EXISTS CAKE_BASE;
DROP TABLE IF EXISTS ADDON;
DROP TABLE IF EXISTS DECORATION;
DROP TABLE IF EXISTS CAKE_SIZE;
DROP TABLE IF EXISTS CAKE_SHAPE;

-- ============================================================
-- INDEPENDENT TABLES
-- ============================================================

CREATE TABLE CAKE_SHAPE (
    cake_shape_id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2)
);

CREATE TABLE CAKE_SIZE (
    size_id INT PRIMARY KEY,
    name VARCHAR(255),
    diameter INT,
    servings INT,
    price_modifier DECIMAL(10, 2)
);

CREATE TABLE DECORATION (
    decoration_id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2)
);

CREATE TABLE ADDON (
    addon_id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2)
);

CREATE TABLE CAKE_BASE (
    base_id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2)
);

CREATE TABLE FROSTING (
    frosting_id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2)
);

CREATE TABLE ALLERGEN (
    allergen_id INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255)
);

CREATE TABLE INGREDIENT (
    ingredient_id INT PRIMARY KEY,
    name VARCHAR(255),
    unit_of_measure VARCHAR(50),
    is_active BOOLEAN
);

CREATE TABLE SUPPLIER (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(255),
    contact_name VARCHAR(255),
    phone VARCHAR(50),
    email VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(50),
    created_at DATE
);

CREATE TABLE CATEGORY (
    category_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE BRANCH (
    branch_id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    phone VARCHAR(50),
    opening_hours VARCHAR(255),
    daily_cake_capacity INT,
    daily_order_limit INT
);

-- ============================================================
-- FIRST-LEVEL DEPENDENCIES
-- ============================================================

CREATE TABLE PRODUCT (
    product_id INT PRIMARY KEY,
    category_id INT,
    name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(10, 2),
    is_active BOOLEAN,
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
);

CREATE TABLE PRODUCT_IMAGE (
     image_id INT PRIMARY KEY,
     product_id INT,
     url VARCHAR(255),
    display_order VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

CREATE TABLE CUSTOMER_ADDRESS (
    address_id INT PRIMARY KEY,
    customer_id INT,
    house_number VARCHAR(100),
    building VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    province VARCHAR(255),
    postal_code VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);

CREATE TABLE PICKUP_SLOT (
    pickup_slot_id INT PRIMARY KEY,
    branch_id INT,
    date DATE,
    time TIME,
    capacity INT,
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id)
);

CREATE TABLE CUSTOMER_ALLERGEN (
    customer_id INT,
    allergen_id INT,
    PRIMARY KEY (customer_id, allergen_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (allergen_id) REFERENCES ALLERGEN(allergen_id)
);

CREATE TABLE INGREDIENT_ALLERGEN (
    ingredient_id INT,
    allergen_id INT,
    PRIMARY KEY (ingredient_id, allergen_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id),
    FOREIGN KEY (allergen_id) REFERENCES ALLERGEN(allergen_id)
);

CREATE TABLE SUPPLIER_INGREDIENT (
    supplier_id INT,
    ingredient_id INT,
    unit_price DECIMAL(10, 2),
    lead_time INT,
    minimum_order_qty INT,
    last_updated DATE,
    PRIMARY KEY (supplier_id, ingredient_id),
    FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

CREATE TABLE FROSTING_INGREDIENT (
    frosting_id INT,
    ingredient_id INT,
    quantity INT,
    PRIMARY KEY (frosting_id, ingredient_id),
    FOREIGN KEY (frosting_id) REFERENCES FROSTING(frosting_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

CREATE TABLE CAKE_BASE_INGREDIENT (
    base_id INT,
    ingredient_id INT,
    quantity INT,
    PRIMARY KEY (base_id, ingredient_id),
    FOREIGN KEY (base_id) REFERENCES CAKE_BASE(base_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

CREATE TABLE PRODUCT_INGREDIENT (
    product_id INT,
    ingredient_id INT,
    quantity_required DECIMAL(10, 2),
    unit_of_measure VARCHAR(50),
    PRIMARY KEY (product_id, ingredient_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

CREATE TABLE PRODUCT_INVENTORY (
    branch_id INT,
    product_id INT,
    name VARCHAR(255),
    quantity_on_hand INT,
    is_active BOOLEAN,
    PRIMARY KEY (branch_id, product_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

CREATE TABLE INGREDIENT_INVENTORY (
    branch_id INT,
    ingredient_id INT,
    name VARCHAR(255),
    quantity_on_hand INT,
    is_active BOOLEAN,
    PRIMARY KEY (branch_id, ingredient_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

-- ============================================================
-- ORDERS & FULFILLMENT
-- ============================================================

CREATE TABLE "ORDER" (
    order_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    pickup_slot_id INT,
    order_date DATE,
    status VARCHAR(50) CHECK (status IN ('Pending', 'Confirmed', 'In Production', 'Ready', 'Completed', 'Cancelled')),
    subtotal DECIMAL(10, 2),
    tax DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    fulfillment_method VARCHAR(50),
    shipping_cost DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id),
    FOREIGN KEY (pickup_slot_id) REFERENCES PICKUP_SLOT(pickup_slot_id)
);

CREATE TABLE PAYMENT (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    amount DECIMAL(10, 2),
    paid_at DATE,
    status VARCHAR(50) CHECK (status IN ('Pending', 'Paid', 'Failed', 'Refunded')),
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
);

CREATE TABLE DELIVERY (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    address_id INT,
    driver VARCHAR(255),
    status VARCHAR(50) CHECK (status IN ('Pending', 'Out for Delivery', 'Delivered', 'Failed')),
    estimated_delivery_time TIME,
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id),
    FOREIGN KEY (address_id) REFERENCES CUSTOMER_ADDRESS(address_id)
);

CREATE TABLE ORDER_ITEM (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_type VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
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
    custom_cake_id INT PRIMARY KEY,
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