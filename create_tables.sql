DROP TABLE IF EXISTS CUSTOM_CAKE_LAYER;
DROP TABLE IF EXISTS CUSTOM_CAKE;
DROP TABLE IF EXISTS ORDER_ITEM;
DROP TABLE IF EXISTS PAYMENT;
DROP TABLE IF EXISTS DELIVERY;
DROP TABLE IF EXISTS "ORDER";
DROP TABLE IF EXISTS INVENTORY;
DROP TABLE IF EXISTS CUSTOMER_ALLERGEN;
DROP TABLE IF EXISTS PRODUCT_INGREDIENT;
DROP TABLE IF EXISTS CAKE_BASE_INGREDIENT;
DROP TABLE IF EXISTS FROSTING_INGREDIENT;
DROP TABLE IF EXISTS SUPPLIER_INGREDIENT;
DROP TABLE IF EXISTS INGREDIENT_ALLERGEN;
DROP TABLE IF EXISTS Pickup_Slot;
DROP TABLE IF EXISTS CUSTOMER_ADDRESS;
DROP TABLE IF EXISTS BRANCH;
DROP TABLE IF EXISTS PRODUCT;
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

-- INDEPENDENT TABLES (No Foreign Keys)
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
    email VARCHAR(255),
    phone VARCHAR(50),
    address VARCHAR(255),
    created_at DATE
);

CREATE TABLE PRODUCT (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    category VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(10, 2),
    is_active BOOLEAN
);

CREATE TABLE BRANCH (
    branch_id INT PRIMARY KEY,
    inventory_id INT,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    phone VARCHAR(50),
    opening_hours VARCHAR(255)
);

-- FIRST-LEVEL DEPENDENCIES (Reference independent tables)

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

CREATE TABLE Pickup_Slot (
    pickup_slot_id INT PRIMARY KEY,
    branch_id INT,
    date DATE,
    capacity INT,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id)
);

CREATE TABLE INGREDIENT_ALLERGEN (
    ingredient_id INT,
    allergen_id INT,
    PRIMARY KEY (ingredient_id, allergen_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id),
    FOREIGN KEY (allergen_id) REFERENCES ALLERGEN(allergen_id)
);

CREATE TABLE SUPPLIER_INGREDIENT (
    supplier_ingredient_id INT PRIMARY KEY,
    supplier_id INT,
    ingredient_id INT,
    unit_price DECIMAL(10, 2),
    lead_time_days INT,
    minimum_order_qty INT,
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
    product_ingredient_id INT PRIMARY KEY,
    product_id INT,
    ingredient_id INT,
    quantity_required DECIMAL(10, 2),
    unit_of_measure VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

CREATE TABLE CUSTOMER_ALLERGEN (
    customer_id INT,
    allergen_id INT,
    PRIMARY KEY (customer_id, allergen_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (allergen_id) REFERENCES ALLERGEN(allergen_id)
);

CREATE TABLE INVENTORY (
    inventory_id INT PRIMARY KEY,
    branch_id INT,
    ingredient_id INT,
    quantity_on_hand DECIMAL(10, 2),
    reorder_level DECIMAL(10, 2),
    reorder_quantity DECIMAL(10, 2),
    last_restocked_at DATE,
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);

-- SECOND-LEVEL DEPENDENCIES (Core E-Commerce)
CREATE TABLE "ORDER" (
    order_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    pickup_slot_id INT,
    order_date DATE,
    status VARCHAR(50),
    subtotal DECIMAL(10, 2),
    tax DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    fulfillment_method VARCHAR(50),
    shipping_cost DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id),
    FOREIGN KEY (pickup_slot_id) REFERENCES Pickup_Slot(pickup_slot_id)
);

-- THIRD-LEVEL DEPENDENCIES (Fulfillment & Items)
CREATE TABLE DELIVERY (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    customer_name VARCHAR(255),
    delivery_fee DECIMAL(10, 2),
    estimated_delivery_time TIME,
    delivery_status VARCHAR(50),
    phone VARCHAR(50),
    house_number VARCHAR(100),
    building VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    province VARCHAR(255),
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
);

CREATE TABLE PAYMENT (
    payment_id INT PRIMARY KEY,
    order_id INT,
    method VARCHAR(50),
    amount DECIMAL(10, 2),
    paid_at DATE,
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id)
);

CREATE TABLE ORDER_ITEM (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    line_total DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES "ORDER"(order_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);


-- CAKE CUSTOMIZATION DEPENDENCIES
CREATE TABLE CUSTOM_CAKE (
    custom_cake_id INT PRIMARY KEY,
    order_item_id INT,
    size_id INT,
    shape_id INT,
    frosting_id INT,
    decoration_id INT,
    addon_id INT,
    layer_count INT,
    cake_message VARCHAR(255),
    special_intructions VARCHAR(255),
    FOREIGN KEY (order_item_id) REFERENCES ORDER_ITEM(order_item_id),
    FOREIGN KEY (size_id) REFERENCES CAKE_SIZE(size_id),
    FOREIGN KEY (shape_id) REFERENCES CAKE_SHAPE(cake_shape_id),
    FOREIGN KEY (frosting_id) REFERENCES FROSTING(frosting_id),
    FOREIGN KEY (decoration_id) REFERENCES DECORATION(decoration_id),
    FOREIGN KEY (addon_id) REFERENCES ADDON(addon_id)
);

CREATE TABLE CUSTOM_CAKE_LAYER (
    layer_id INT PRIMARY KEY,
    custom_cake_id INT,
    base_id INT,
    layer_number INT,
    FOREIGN KEY (custom_cake_id) REFERENCES CUSTOM_CAKE(custom_cake_id),
    FOREIGN KEY (base_id) REFERENCES CAKE_BASE(base_id)
);