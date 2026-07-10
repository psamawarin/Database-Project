-- ============================================================
-- SAMPLE DATA
-- ============================================================

INSERT INTO CAKE_SHAPE (cake_shape_id, name, price) VALUES
    (1, 'Round', 0.00),
    (2, 'Square', 5.00),
    (3, 'Heart', 10.00);

INSERT INTO CAKE_SIZE (size_id, name, diameter, servings, price_modifier) VALUES
    (1, 'Small (6")', 6, 8, 0.00),
    (2, 'Medium (8")', 8, 16, 15.00),
    (3, 'Large (10")', 10, 28, 30.00);

INSERT INTO DECORATION (decoration_id, name, price) VALUES
    (1, 'Edible Gold Leaf', 8.00),
    (2, 'Fresh Flowers', 6.50),
    (3, 'Chocolate Shavings', 3.00),
    (4, 'Custom Fondant Topper', 12.00);

INSERT INTO ADDON (addon_id, name, price) VALUES
    (1, 'Birthday Candle Set', 2.50),
    (2, 'Extra Piping Border', 4.00),
    (3, 'Personalized Card', 3.50);

INSERT INTO CAKE_BASE (base_id, name, price) VALUES
   (1, 'Vanilla Sponge', 0.00),
   (2, 'Chocolate Fudge', 5.00),
   (3, 'Red Velvet', 6.00),
   (4, 'Lemon Sponge', 4.00),
   (5, 'Strawberry', 3.00),
   (6, 'Chocolate Mousse', 5.00);


INSERT INTO FROSTING (frosting_id, name, price) VALUES
    (1, 'Buttercream', 0.00),
    (2, 'Cream Cheese', 3.00),
    (3, 'Ganache', 5.00),
    (4, 'Whipped Cream', 2.00);

INSERT INTO ALLERGEN (allergen_id, name, description) VALUES
    (1, 'Peanuts', 'Includes peanuts and peanut derivatives'),
    (2, 'Tree Nuts', 'Includes almonds, walnuts, cashews, etc.'),
    (3, 'Dairy', 'Includes milk, butter, cream, cheese'),
    (4, 'Eggs', 'Includes whole eggs and egg derivatives'),
    (5, 'Gluten', 'Includes wheat and wheat derivatives'),
    (6, 'Soy', 'Includes soy and soy derivatives');

INSERT INTO INGREDIENT (ingredient_id, name, unit_of_measure, is_active) VALUES
    (1, 'Wheat Flour', 'g', TRUE),
    (2, 'Sugar', 'g', TRUE),
    (3, 'Butter', 'g', TRUE),
    (4, 'Eggs', 'pcs', TRUE),
    (5, 'Cocoa Powder', 'g', TRUE),
    (6, 'Cream Cheese', 'g', TRUE),
    (7, 'Almond Extract', 'ml', TRUE),
    (8, 'Whole Milk', 'ml', TRUE),
    (9, 'Vanilla Extract', 'ml', TRUE),
    (10, 'Red Food Coloring', 'ml', TRUE),
    (11, 'Lemon Zest', 'g', TRUE),
    (12, 'Peanut Butter Chips', 'g', TRUE),
    (13, 'Soy Lecithin', 'g', TRUE),
    (14, 'Heavy Cream', 'ml', TRUE),
    (15, 'Strawberry', 'g', TRUE);


INSERT INTO SUPPLIER (supplier_id, name, contact_name, phone, email, address) VALUES
    (1, 'Golden Grain Wholesale', 'Wilford Bowman', '02-234-5678', 'sales@goldengrain.co.th', '99 Rama IV Rd, Bangkok'),
    (2, 'Dairy Fresh Co.', 'Lindsay Burgess', '02-345-6789', 'orders@dairyfresh.co.th', '45 Sukhumvit Rd, Bangkok'),
    (3, 'Sweet Supply Co.', 'Wyatt Phelps', '02-456-7890', 'contact@sweetsupply.co.th', '12 Silom Rd, Bangkok'),
    (4, 'Vanilla Garden Co.', 'Ramona Huynh', '02-496-7530', 'contact@vanillagarden.co.th', '34 Sukhumvit Rd, Bangkok');

INSERT INTO "user" (email, created_at, password_hash, last_login_at) VALUES
    ('nicha.b@email.com', '2025-03-12','$2a$12$Z6Zx0IqB6n/eVYxQgV01BOSWi4JXkwKklGnH4ReOCt1LS3moNevkK','2026-07-08 19:30:00'),
    ('kitti.s@email.com', '2025-05-20', '$2a$12$BQroPhM3u557VjQGblw19unLKvR696191Io6TnBKWonjNv5dXHi0a', '2026-07-08 20:30:00'),
    ('raquel.r@email.com',  '2025-11-02', '$2a$12$hzDsPobdXxe3Wkw.vhwQ9ecppQbfU/l71Db4NMjUobZVRLRwNVgsq', '2026-07-08 19:31:00'),
    ('herbet.b@email.com',  '2026-01-15', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-08 19:30:00'),
    ('john.d@email.com',  '2026-01-15', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-08 19:30:00'),
    ('jane.s@email.com',  '2026-01-15', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-08 19:30:00'),
    ('david.b@email.com',  '2026-01-15', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-08 19:30:00'),
    ('Sarah.w@email.com',  '2026-01-15', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-08 19:30:00');


INSERT INTO CUSTOMER (first_name, last_name,  phone, user_id) VALUES
    ( 'Nicha', 'Boonmee',  '081-234-5678',1),
    ( 'Kittipong', 'Sirikul', '082-345-6789',2),
    ( 'Raquel', 'Riggs',  '083-456-7890',3),
    ( 'Herbert', 'Bradley',  '084-567-8901',4);

INSERT INTO CATEGORY (category_id, name) VALUES
    (1, 'Birthday Cakes'),
    (2, 'Cupcakes'),
    (3, 'Wedding Cakes'),
    (4, 'Pastries');

INSERT INTO BRANCH (branch_id, name, address, city, phone, opening_hours, daily_cake_capacity, daily_order_limit) VALUES
    (1, 'Sukhumvit Branch', '188 Sukhumvit Soi 24', 'Bangkok', '02-111-2222', '08:00-20:00', 25, 60),
    (2, 'Silom Branch', '55 Silom Rd', 'Bangkok', '02-222-3333', '09:00-19:00', 15, 40),
    (3, 'Salaya Branch', '24 Salaya-Nakhon Chai Si Road', 'Salaya', '02-222-3333', '09:00-19:00', 20, 50);

INSERT INTO EMPLOYEE (first_name, last_name, phone, branch_id, user_id) VALUES
    ('John', 'Doe', '081-555-1234', 1,5),
    ('Jane', 'Smith', '089-555-5678', 3,6),
    ('David', 'Brown', '087-555-7890', 2,7),
    ('Sarah', 'Wilson', '084-555-2345', 3,8);

-- ------------------------------------------------------------
-- First-level dependencies
-- ------------------------------------------------------------

INSERT INTO PRODUCT (product_id, category_id, name, description, price, is_active) VALUES
    (1, 1, 'Classic Chocolate Birthday Cake', 'Chocolate sponge with buttercream frosting', 28.00, TRUE),
    (2, 2, 'Vanilla Bean Cupcake (6-pack)', 'Vanilla cupcakes with cream cheese frosting', 15.00, TRUE),
    (3, 4, 'Butter Croissant', 'Classic French butter croissant', 3.50, TRUE),
    (4, 1, 'Red Velvet Birthday Cake', 'Red velvet sponge with cream cheese frosting', 32.00, TRUE),
    (5, 3, 'Elegant Tier Wedding Cake', 'Three-tier vanilla and chocolate wedding cake', 250.00, TRUE),
    (6, 4, 'Cannoli', ' tube-shaped shell of fried pastry dough, filled with a sweet and creamy filling', 100, TRUE);

INSERT INTO PRODUCT_IMAGE (image_id, product_id, url, display_order) VALUES
    (1, 1, 'https://example.com/img/choc-cake-1.jpg', '1'),
    (2, 1, 'https://example.com/img/choc-cake-2.jpg', '2'),
    (3, 2, 'https://example.com/img/vanilla-cupcake.jpg', '1'),
    (4, 5, 'https://example.com/img/wedding-cake.jpg', '1'),
    (5, 2, 'https://example.com/img/vanilla-cupcake-1.jpg', '2'),
    (6, 6, 'https://example.com/img/random-cannoli.jpg', '1'),
    (7, 6, 'https://example.com/img/side-cannoli.jpg', '2');


INSERT INTO CUSTOMER_ADDRESS (customer_id, house_number, building, street, city, province, postal_code) VALUES
    (1, '188', 'The Lumpini 24', 'Sukhumvit Soi 24', 'Bangkok', 'Bangkok', '10110'),
    (2, '45/2', NULL, 'Silom Soi 6', 'Bangkok', 'Bangkok', '10500'),
    ( 3, '9', 'Rain Tree Condo', 'Ratchada Soi 12', 'Bangkok', 'Bangkok', '10310');

INSERT INTO PICKUP_SLOT (pickup_slot_id, branch_id, date, time, capacity) VALUES
    (1, 1, '2026-07-10', '10:00:00', 5),
    (2, 1, '2026-07-10', '14:00:00', 5),
    (3, 2, '2026-07-11', '11:00:00', 4),
    (4, 1, '2026-07-15', '09:00:00', 5),
    (5, 3, '2026-07-15', '09:00:00', 5),
    (6, 3, '2026-07-11', '11:00:00', 5);

INSERT INTO CUSTOMER_ALLERGEN (customer_id, allergen_id) VALUES
    (1, 2),
    (3, 3),
    (3, 4);

INSERT INTO INGREDIENT_ALLERGEN (ingredient_id, allergen_id) VALUES
    (1, 5),   -- Wheat Flour -> Gluten
    (3, 3),   -- Butter -> Dairy
    (4, 4),   -- Eggs -> Eggs
    (6, 3),   -- Cream Cheese -> Dairy
    (7, 2),   -- Almond Extract -> Tree Nuts
    (8, 3),   -- Whole Milk -> Dairy
    (12, 1),  -- Peanut Butter Chips -> Peanuts
    (13, 6),  -- Soy Lecithin -> Soy
    (14, 3);  -- Heavy Cream -> Dairy

INSERT INTO SUPPLIER_INGREDIENT (supplier_id, ingredient_id, unit_price, lead_time, minimum_order_qty, last_updated) VALUES
    (1, 1, 0.05, 3, 5000, '2026-06-01'),
    (1, 2, 0.04, 3, 5000, '2026-06-01'),
    (2, 3, 0.15, 2, 2000, '2026-06-05'),
    (2, 6, 0.20, 2, 1000, '2026-06-05'),
    (2, 8, 0.03, 2, 3000, '2026-06-05'),
    (3, 4, 0.30, 1, 500, '2026-06-10'),
    (3, 5, 0.18, 4, 1000, '2026-06-10');

INSERT INTO FROSTING_INGREDIENT (frosting_id, ingredient_id, quantity) VALUES
    (1, 3, 200),   -- Buttercream: Butter
    (1, 2, 150),   -- Buttercream: Sugar
    (2, 6, 250),   -- Cream Cheese frosting: Cream Cheese
    (2, 2, 100),   -- Cream Cheese frosting: Sugar
    (3, 5, 100),   -- Ganache: Cocoa Powder
    (3, 14, 200),  -- Ganache: Heavy Cream
    (4, 14, 300);  -- Whipped Cream: Heavy Cream

INSERT INTO CAKE_BASE_INGREDIENT (base_id, ingredient_id, quantity) VALUES
    (1, 1, 400),   -- Vanilla Sponge: Flour
    (1, 4, 4),     -- Vanilla Sponge: Eggs
    (1, 9, 10),    -- Vanilla Sponge: Vanilla Extract
    (2, 1, 350),   -- Chocolate Fudge: Flour
    (2, 5, 100),   -- Chocolate Fudge: Cocoa Powder
    (2, 4, 4),     -- Chocolate Fudge: Eggs
    (3, 1, 380),   -- Red Velvet: Flour
    (3, 10, 15),   -- Red Velvet: Red Food Coloring
    (3, 4, 4),     -- Red Velvet: Eggs
    (4, 1, 380),   -- Lemon Sponge: Flour
    (4, 11, 20),   -- Lemon Sponge: Lemon Zest
    (4, 4, 4);     -- Lemon Sponge: Eggs

INSERT INTO PRODUCT_INGREDIENT (product_id, ingredient_id, quantity_required, unit_of_measure) VALUES
    (1, 1, 350, 'g'),
    (1, 5, 100, 'g'),
    (1, 3, 200, 'g'),
    (2, 1, 200, 'g'),
    (2, 6, 150, 'g'),
    (3, 1, 150, 'g'),
    (3, 3, 100, 'g'),
    (4, 1, 380, 'g'),
    (4, 10, 15, 'ml'),
    (4, 6, 200, 'g');

INSERT INTO PRODUCT_INVENTORY (branch_id, product_id, name, quantity_on_hand, is_active) VALUES
    (1, 1, 'Classic Chocolate Birthday Cake', 8, TRUE),
    (1, 2, 'Vanilla Bean Cupcake (6-pack)', 20, TRUE),
    (1, 4, 'Butter Croissant', 40, TRUE),
    (2, 1, 'Classic Chocolate Birthday Cake', 4, TRUE),
    (2, 2, 'Red Velvet Birthday Cake', 3, TRUE),
    (3, 1, 'Classic Chocolate Birthday Cake', 4, TRUE),
    (3, 2, 'Red Velvet Birthday Cake', 5, TRUE);

INSERT INTO INGREDIENT_INVENTORY (branch_id, ingredient_id, name, quantity_on_hand, is_active) VALUES
    (1, 1, 'Wheat Flour', 15000, TRUE),
    (1, 2, 'Sugar', 12000, TRUE),
    (1, 3, 'Butter', 8000, TRUE),
    (1, 4, 'Eggs', 600, TRUE),
    (2, 1, 'Wheat Flour', 9000, TRUE),
    (2, 6, 'Cream Cheese', 4000, TRUE);

-- ------------------------------------------------------------
-- Custom cake example (built before it's attached to an order)
-- ------------------------------------------------------------

INSERT INTO CUSTOM_CAKE ( size_id, cake_shape_id, cake_message, special_instructions) VALUES
    ( 2, 1, 'Happy Birthday Nicha!', 'Please make the message in gold icing'),
    ( 3, 3, 'Congratulations!', 'No nuts at all -- severe allergy');

INSERT INTO CUSTOM_CAKE_LAYER (layer_number, custom_cake_id, frosting_id, base_id) VALUES
    (1, 1, 1, 2),   -- Cake 1, layer 1: Buttercream on Chocolate Fudge
    (2, 1, 1, 1),   -- Cake 1, layer 2: Buttercream on Vanilla Sponge
    (1, 2, 3, 3);   -- Cake 2, layer 1: Ganache on Red Velvet

INSERT INTO CUSTOM_CAKE_DECORATION (custom_cake_id, decoration_id, quantity) VALUES
    (1, 1, 1),  -- Cake 1: Edible Gold Leaf
    (2, 2, 3);  -- Cake 2: Fresh Flowers x3

INSERT INTO CUSTOM_CAKE_ADDON (custom_cake_id, addon_id, quantity) VALUES
    (1, 1, 1),  -- Cake 1: Birthday Candle Set
    (2, 3, 1);  -- Cake 2: Personalized Card

-- ------------------------------------------------------------
-- Orders
-- ------------------------------------------------------------

INSERT INTO CUSTOMER_ORDER ( customer_id, branch_id, pickup_slot_id, order_date, status, subtotal, tax, total_amount, fulfillment_method, shipping_cost) VALUES
    ( 1, 1, 1, '2026-07-05', 'Confirmed', 63.50, 4.45, 67.95, 'Pickup', 0.00),
    ( 2, 1, 2, '2026-07-06', 'Pending', 15.00, 1.05, 16.05, 'Pickup', 0.00),
    ( 3, 2, 3, '2026-07-06', 'Completed', 250.00, 17.50, 267.50, 'Delivery', 15.00);

INSERT INTO ORDER_ITEM ( order_id, item_type, quantity, unit_price) VALUES
    ( 1, 'custom_cake', 1, 51.50),  -- size(15)+shape(0)+decoration(8)+addon(2.50)+base cake price(~25.50 est.)
    ( 2, 'product', 1, 3.50),       -- a croissant added to the same order
    ( 3, 'product', 1, 15.00),      -- cupcakes
    ( 3, 'product', 1, 250.00);     -- wedding cake

INSERT INTO ORDER_ITEM_CUSTOM_CAKE (order_item_id, custom_cake_id) VALUES
    (1, 1)
;

INSERT INTO ORDER_ITEM_PRODUCT (order_item_id, product_id) VALUES
    (2, 3),
    (3, 2),
    (4, 5);

INSERT INTO PAYMENT (order_id, payment_method, amount, paid_at, status) VALUES
    (1, 'Credit Card', 67.95, '2026-07-05', 'Paid'),
    ( 2, 'PromptPay', 16.05, NULL, 'Pending'),
    ( 3, 'Credit Card', 267.50, '2026-07-06', 'Paid');

INSERT INTO DELIVERY ( order_id, address_id, driver, status, estimated_delivery_time) VALUES
    ( 3, 3, 'Somchai T.', 'Delivered', '15:30:00');