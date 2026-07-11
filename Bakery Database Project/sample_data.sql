-- ------------------------------------------------------------
-- Independent tables
-- ------------------------------------------------------------

INSERT INTO CAKE_SHAPE (cake_shape_id, name, price) VALUES
        (1, 'Round', 0.00),
        (2, 'Square', 5.00),
        (3, 'Heart', 10.00);

INSERT INTO CAKE_SIZE (size_id, name, diameter, servings, price_modifier) VALUES
      (1, 'Small (6")', 6, 8, 0.00),
      (2, 'Medium (8")', 8, 16, 15.00),
      (3, 'Large (10")', 10, 28, 30.00);


INSERT INTO DECORATION (decoration_id, name, price) VALUES
    (1, 'Edible Gold Leaf', 20.00),
    (2, 'Fresh Flowers', 15.00),
    (3, 'Chocolate Shavings', 30.00),
    (4, 'Custom Fondant Topper', 60.00),
    (5, 'Macaron Border', 30.00),
    (6, 'Sugar Pearls', 40.00),
    (7, 'Piped Rosettes', 27.50),
    (8, 'Edible Glitter', 10.00),
    (9, 'Chocolate Drip', 20.00),
    (10, 'Fresh Fruit Topping', 50.00),
    (11, 'Character Figurine', 75.00),
    (12, 'Metallic Paint Accent', 10.00);

INSERT INTO ADDON (addon_id, name, price) VALUES
      (1, 'Birthday Candle Set', 25.00),
      (2, 'Extra Piping Border', 40.00),
      (3, 'Personalized Card', 35.00),
      (4, 'Gift Box Packaging', 60.00),
      (5, 'Extra Frosting Layer', 55.00),
      (6, 'Cake Stand Rental', 80.00),
      (7, 'Sparkler Candles', 45.00),
      (8, 'Ribbon Wrap', 30.00),
      (9, 'Photo Print Topper', 90.00),
      (10, 'Extra Sweetness Reduction', 0.00),
      (11, 'Kosher Certification Add-on', 100.00),
      (12, 'Rush Order Fee', 150.00);

INSERT INTO CAKE_BASE (base_id, name, price) VALUES
     (1, 'Vanilla Sponge', 0.00),
     (2, 'Chocolate Fudge', 15.00),
     (3, 'Red Velvet', 15.00),
     (4, 'Lemon Sponge', 15.00),
     (5, 'Strawberry', 0.00),
     (6, 'Chocolate Mousse', 25.00),
     (7, 'Carrot Cake', 15.00),
     (8, 'Matcha Sponge', 15.00),
     (9, 'Coffee Mocha', 15.00),
     (10, 'Coconut Sponge', 15.00);

INSERT INTO FROSTING (frosting_id, name, price) VALUES
    (1, 'Buttercream', 0.00),
    (2, 'Cream Cheese', 3.00),
    (3, 'Ganache', 5.00),
    (4, 'Whipped Cream', 2.00),
    (5, 'Fondant', 7.00),
    (6, 'Swiss Meringue', 4.50),
    (7, 'Italian Meringue', 5.00),
    (8, 'Chocolate Buttercream', 3.50),
    (9, 'Mascarpone', 6.00),
    (10, 'Peanut Butter Frosting', 4.00);

INSERT INTO ALLERGEN (allergen_id, name, description) VALUES
      (1, 'Peanuts', 'Includes peanuts and peanut derivatives'),
      (2, 'Tree Nuts', 'Includes almonds, walnuts, cashews, etc.'),
      (3, 'Dairy', 'Includes milk, butter, cream, cheese'),
      (4, 'Eggs', 'Includes whole eggs and egg derivatives'),
      (5, 'Gluten', 'Includes wheat and wheat derivatives'),
      (6, 'Soy', 'Includes soy and soy derivatives'),
      (7, 'Sesame', 'Includes sesame seeds and sesame oil'),
      (8, 'Shellfish', 'Includes shrimp, crab, and other shellfish derivatives'),
      (9, 'Fish', 'Includes fish and fish-derived gelatin'),
      (10, 'Sulphites', 'Includes preservatives derived from sulphur dioxide');

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
         (15, 'Strawberry', 'g', TRUE),
         (16, 'Baking Powder', 'g', TRUE),
         (17, 'Salt', 'g', TRUE),
         (18, 'Carrots', 'g', TRUE),
         (19, 'Matcha Powder', 'g', TRUE),
         (20, 'Coffee Extract', 'ml', TRUE),
         (21, 'Coconut Flakes', 'g', TRUE),
         (22, 'Honey', 'g', TRUE),
         (23, 'Cinnamon', 'g', TRUE),
         (24, 'Cream of Tartar', 'g', TRUE),
         (25, 'Gelatin', 'g', TRUE);

INSERT INTO SUPPLIER (supplier_id, name, contact_name, phone, email, address) VALUES
          (1, 'Golden Grain Wholesale', 'Wilford Bowman', '02-234-5678', 'sales@goldengrain.co.th', '99 Rama IV Rd, Bangkok'),
          (2, 'Dairy Fresh Co.', 'Lindsay Burgess', '02-345-6789', 'orders@dairyfresh.co.th', '45 Sukhumvit Rd, Bangkok'),
          (3, 'Sweet Supply Co.', 'Wyatt Phelps', '02-456-7890', 'contact@sweetsupply.co.th', '12 Silom Rd, Bangkok'),
          (4, 'Vanilla Garden Co.', 'Ramona Huynh', '02-496-7530', 'contact@vanillagarden.co.th', '34 Sukhumvit Rd, Bangkok'),
          (5, 'Thai Spice Traders', 'Anurak Somboon', '02-567-8901', 'sales@thaispice.co.th', '78 Charoen Krung Rd, Bangkok'),
          (6, 'Bangkok Bakery Supplies', 'Kanya Intharat', '02-678-9012', 'info@bkkbakerysupply.co.th', '21 Phahonyothin Rd, Bangkok'),
          (7, 'Premium Cocoa Imports', 'Jonathan Reeve', '02-789-0123', 'orders@premiumcocoa.co.th', '5 Rama IX Rd, Bangkok'),
          (8, 'Fresh Farm Eggs Co.', 'Suda Panya', '02-890-1234', 'contact@freshfarmeggs.co.th', '60 Ladprao Rd, Bangkok'),
          (9, 'Nutty World Wholesale', 'Isaac Meyer', '02-901-2345', 'sales@nuttyworld.co.th', '18 Petchaburi Rd, Bangkok'),
          (10, 'Coastal Coconut Supply', 'Nalinee Srisuk', '038-123-456', 'info@coastalcoconut.co.th', '3 Beach Rd, Pattaya');


-- Rows 1-12 map to CUSTOMER, rows 13-24 map to EMPLOYEE (inserted below, in this order).
INSERT INTO "user" (email, created_at, password_hash, last_login_at) VALUES
         ('nicha.b@email.com',     '2025-03-12', '$2a$12$Z6Zx0IqB6n/eVYxQgV01BOSWi4JXkwKklGnH4ReOCt1LS3moNevkK', '2026-07-08 19:30:00'),
         ('kitti.s@email.com',     '2025-05-20', '$2a$12$BQroPhM3u557VjQGblw19unLKvR696191Io6TnBKWonjNv5dXHi0a', '2026-07-08 20:30:00'),
         ('raquel.r@email.com',    '2025-11-02', '$2a$12$hzDsPobdXxe3Wkw.vhwQ9ecppQbfU/l71Db4NMjUobZVRLRwNVgsq', '2026-07-08 19:31:00'),
         ('herbet.b@email.com',    '2026-01-15', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-08 19:30:00'),
         ('somsak.j@email.com',    '2026-01-20', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-10 08:15:00'),
         ('ploy.s@email.com',      '2026-01-25', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-12 12:00:00'),
         ('anong.w@email.com',     '2026-02-02', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-15 09:45:00'),
         ('thanawat.c@email.com',  '2026-02-10', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-20 17:20:00'),
         ('malee.b@email.com',     '2026-02-18', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-22 14:05:00'),
         ('chatchai.r@email.com',  '2026-03-01', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-25 10:10:00'),
         ('siriporn.k@email.com',  '2026-03-10', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-28 19:00:00'),
         ('prasert.w@email.com',   '2026-03-18', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-30 21:30:00'),
         ('john.d@email.com',      '2026-01-15', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-08 19:30:00'),
         ('jane.s@email.com',      '2026-01-15', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-08 19:30:00'),
         ('david.b@email.com',     '2026-01-15', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-08 19:30:00'),
         ('sarah.w@email.com',     '2026-01-15', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-08 19:30:00'),
         ('michael.c@email.com',   '2026-01-18', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-09 08:00:00'),
         ('lisa.t@email.com',      '2026-01-22', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-11 13:00:00'),
         ('robert.k@email.com',    '2026-01-25', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-14 07:30:00'),
         ('amy.p@email.com',       '2026-01-28', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-17 15:45:00'),
         ('kevin.l@email.com',     '2026-02-01', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-19 18:10:00'),
         ('nina.t@email.com',      '2026-02-05', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-21 09:00:00'),
         ('mark.j@email.com',      '2026-02-08', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-23 11:25:00'),
         ('grace.l@email.com',     '2026-02-12', '$2a$12$o7f4QfRqHvhqSCRodQvvku0SYgwFFs7xo05rOCdcFjbTXjiIZnOLK', '2026-06-26 16:40:00');

-- CUSTOMER is GENERATED ALWAYS AS IDENTITY -> ids 1-12, using user_id 1-12
INSERT INTO CUSTOMER (first_name, last_name, phone, user_id) VALUES
         ('Nicha', 'Boonmee', '081-234-5678', 1),
         ('Kittipong', 'Sirikul', '082-345-6789', 2),
         ('Raquel', 'Riggs', '083-456-7890', 3),
         ('Herbert', 'Bradley', '084-567-8901', 4),
         ('Somsak', 'Jaidee', '085-111-2222', 5),
         ('Ploy', 'Suthep', '086-222-3333', 6),
         ('Anong', 'Wattana', '087-333-4444', 7),
         ('Thanawat', 'Chaiyaporn', '088-444-5555', 8),
         ('Malee', 'Boonsong', '089-555-6666', 9),
         ('Chatchai', 'Ruangrit', '090-666-7777', 10),
         ('Siriporn', 'Kaewkla', '091-777-8888', 11),
         ('Prasert', 'Wongsawat', '092-888-9999', 12);

INSERT INTO CATEGORY (category_id, name) VALUES
         (1, 'Birthday Cakes'),
         (2, 'Cupcakes'),
         (3, 'Wedding Cakes'),
         (4, 'Pastries'),
         (5, 'Cookies'),
         (6, 'Bread'),
         (7, 'Seasonal Specials'),
         (8, 'Vegan Treats'),
         (9, 'Gluten-Free'),
         (10, 'Gift Sets');

INSERT INTO BRANCH (branch_id, name, address, city, phone, opening_hours, daily_cake_capacity, daily_order_limit) VALUES
          (1, 'Sukhumvit Branch', '188 Sukhumvit Soi 24', 'Bangkok', '02-111-2222', '08:00-20:00', 25, 60),
          (2, 'Silom Branch', '55 Silom Rd', 'Bangkok', '02-222-3333', '09:00-19:00', 15, 40),
          (3, 'Salaya Branch', '24 Salaya-Nakhon Chai Si Road', 'Salaya', '02-222-3333', '09:00-19:00', 20, 50),
          (4, 'Chatuchak Branch', '10 Kamphaeng Phet Rd', 'Bangkok', '02-333-4444', '08:00-18:00', 18, 45),
          (5, 'Thonglor Branch', '77 Thonglor Soi 10', 'Bangkok', '02-444-5555', '09:00-21:00', 22, 55),
          (6, 'Ari Branch', '5 Phahonyothin Soi 7', 'Bangkok', '02-555-6666', '08:00-19:00', 16, 42),
          (7, 'Ekkamai Branch', '30 Ekkamai Soi 4', 'Bangkok', '02-666-7777', '09:00-20:00', 20, 48),
          (8, 'Ratchada Branch', '12 Ratchadaphisek Rd', 'Bangkok', '02-777-8888', '08:00-19:00', 17, 44),
          (9, 'Nonthaburi Branch', '99 Rattanathibet Rd', 'Nonthaburi', '02-888-9999', '08:00-18:00', 14, 35),
          (10, 'Pattaya Branch', '2 Beach Rd', 'Pattaya', '038-999-0000', '09:00-21:00', 20, 50);

INSERT INTO EMPLOYEE (first_name, last_name, phone, branch_id, user_id) VALUES
            ('John', 'Doe', '081-555-1234', 1, 13),
            ('Jane', 'Smith', '089-555-5678', 3, 14),
            ('David', 'Brown', '087-555-7890', 2, 15),
            ('Sarah', 'Wilson', '084-555-2345', 3, 16),
            ('Michael', 'Chen', '083-555-3456', 4, 17),
            ('Lisa', 'Tanaka', '082-555-4567', 5, 18),
            ('Robert', 'Kim', '086-555-5678', 6, 19),
            ('Amy', 'Patel', '085-555-6789', 7, 20),
            ('Kevin', 'Lee', '081-555-7890', 8, 21),
            ('Nina', 'Torres', '080-555-8901', 9, 22),
            ('Mark', 'Johnson', '089-555-9012', 10, 23),
            ('Grace', 'Liu', '088-555-0123', 1, 24);

-- ------------------------------------------------------------
-- First-level dependencies
-- ------------------------------------------------------------

INSERT INTO PRODUCT (product_id, category_id, name, description, price, is_active) VALUES
           (1, 1, 'Classic Chocolate Birthday Cake', 'Chocolate sponge with buttercream frosting', 28.00, TRUE),
           (2, 2, 'Vanilla Bean Cupcake (6-pack)', 'Vanilla cupcakes with cream cheese frosting', 15.00, TRUE),
           (3, 4, 'Butter Croissant', 'Classic French butter croissant', 3.50, TRUE),
           (4, 1, 'Red Velvet Birthday Cake', 'Red velvet sponge with cream cheese frosting', 32.00, TRUE),
           (5, 3, 'Elegant Tier Wedding Cake', 'Three-tier vanilla and chocolate wedding cake', 250.00, TRUE),
           (6, 4, 'Cannoli', 'Tube-shaped shell of fried pastry dough, filled with a sweet and creamy filling', 5.00, TRUE),
           (7, 5, 'Chocolate Chip Cookie (dozen)', 'Classic chewy chocolate chip cookies', 12.00, TRUE),
           (8, 6, 'Sourdough Loaf', 'Naturally leavened artisan sourdough', 6.50, TRUE),
           (9, 7, 'Pumpkin Spice Cake (Seasonal)', 'Autumn spiced cake with cream cheese frosting', 30.00, TRUE),
           (10, 8, 'Vegan Carrot Cupcake (6-pack)', 'Plant-based carrot cupcakes with cashew frosting', 18.00, TRUE),
           (11, 9, 'Gluten-Free Brownie Box', 'Fudgy gluten-free brownies, box of 8', 20.00, TRUE),
           (12, 10, 'Assorted Pastry Gift Box', 'Curated box of seasonal pastries', 45.00, TRUE),
           (13, 4, 'Matcha Swiss Roll', 'Light sponge roll with matcha cream filling', 22.00, TRUE),
           (14, 4, 'Lemon Meringue Tart', 'Tart lemon curd topped with toasted meringue', 8.00, TRUE),
           (15, 3, 'Mini Wedding Cake (2-tier)', 'Two-tier vanilla wedding cake for small gatherings', 150.00, TRUE),
           (16, 1, 'Rainbow Sprinkle Birthday Cake', 'Vanilla cake with rainbow sprinkles and buttercream', 30.00, TRUE);

INSERT INTO PRODUCT_IMAGE (image_id, product_id, url, display_order) VALUES
             (1, 1, 'https://example.com/img/choc-cake-1.jpg', 1),
             (2, 1, 'https://example.com/img/choc-cake-2.jpg', 2),
             (3, 2, 'https://example.com/img/vanilla-cupcake.jpg', 1),
             (4, 2, 'https://example.com/img/vanilla-cupcake-1.jpg', 2),
             (5, 5, 'https://example.com/img/wedding-cake.jpg', 1),
             (6, 6, 'https://example.com/img/random-cannoli.jpg', 1),
             (7, 6, 'https://example.com/img/side-cannoli.jpg', 2),
             (8, 4, 'https://example.com/img/red-velvet-1.jpg', 1),
             (9, 7, 'https://example.com/img/cookies-1.jpg', 1),
             (10, 8, 'https://example.com/img/sourdough-1.jpg', 1),
             (11, 9, 'https://example.com/img/pumpkin-spice-1.jpg', 1),
             (12, 10, 'https://example.com/img/vegan-carrot-1.jpg', 1),
             (13, 11, 'https://example.com/img/gf-brownie-1.jpg', 1),
             (14, 12, 'https://example.com/img/gift-box-1.jpg', 1),
             (15, 13, 'https://example.com/img/matcha-roll-1.jpg', 1),
             (16, 14, 'https://example.com/img/lemon-tart-1.jpg', 1),
             (17, 15, 'https://example.com/img/mini-wedding-1.jpg', 1),
             (18, 16, 'https://example.com/img/rainbow-cake-1.jpg', 1),
             (19, 16, 'https://example.com/img/rainbow-cake-2.jpg', 2),
             (20, 3, 'https://example.com/img/croissant-1.jpg', 1);

-- CUSTOMER_ADDRESS is GENERATED ALWAYS AS IDENTITY -> ids 1-13
INSERT INTO CUSTOMER_ADDRESS (customer_id, house_number, building, street, city, province, postal_code) VALUES
            (1, '188', 'The Lumpini 24', 'Sukhumvit Soi 24', 'Bangkok', 'Bangkok', '10110'),
            (2, '45/2', NULL, 'Silom Soi 6', 'Bangkok', 'Bangkok', '10500'),
            (3, '9', 'Rain Tree Condo', 'Ratchada Soi 12', 'Bangkok', 'Bangkok', '10310'),
            (4, '22', 'Baan Suan Villas', 'Sathorn Soi 8', 'Bangkok', 'Bangkok', '10120'),
            (5, '150/3', NULL, 'Salaya Rd', 'Salaya', 'Nakhon Pathom', '73170'),
            (6, '8', 'The Address Chatuchak', 'Phahonyothin Rd', 'Bangkok', 'Bangkok', '10900'),
            (7, '19/1', NULL, 'Thonglor Soi 13', 'Bangkok', 'Bangkok', '10110'),
            (8, '5', 'Ari Hills', 'Phahonyothin Soi 7', 'Bangkok', 'Bangkok', '10400'),
            (9, '77', NULL, 'Ekkamai Soi 4', 'Bangkok', 'Bangkok', '10110'),
            (10, '30/2', 'Ratchada Residence', 'Ratchadaphisek Rd', 'Bangkok', 'Bangkok', '10310'),
            (11, '14', NULL, 'Rattanathibet Rd', 'Nonthaburi', 'Nonthaburi', '11000'),
            (12, '2', 'Beach Condo', 'Beach Rd', 'Pattaya', 'Chonburi', '20150'),
            (1, '188', 'The Lumpini 24', 'Sukhumvit Soi 24 (Office)', 'Bangkok', 'Bangkok', '10110');

INSERT INTO PICKUP_SLOT (pickup_slot_id, branch_id, date, time, capacity) VALUES
              (1, 1, '2026-07-10', '10:00:00', 5),
              (2, 1, '2026-07-10', '14:00:00', 5),
              (3, 2, '2026-07-11', '11:00:00', 4),
              (4, 1, '2026-07-15', '09:00:00', 5),
              (5, 3, '2026-07-15', '09:00:00', 5),
              (6, 3, '2026-07-11', '11:00:00', 5),
              (7, 4, '2026-07-12', '10:00:00', 6),
              (8, 5, '2026-07-12', '13:00:00', 5),
              (9, 6, '2026-07-13', '09:30:00', 4),
              (10, 7, '2026-07-13', '15:00:00', 6),
              (11, 8, '2026-07-14', '11:30:00', 5),
              (12, 9, '2026-07-14', '16:00:00', 4),
              (13, 10, '2026-07-16', '10:30:00', 5),
              (14, 2, '2026-07-17', '12:00:00', 4),
              (15, 5, '2026-07-18', '17:00:00', 6);

INSERT INTO CUSTOMER_ALLERGEN (customer_id, allergen_id) VALUES
                 (1, 2),
                 (3, 3),
                 (3, 4),
                 (5, 5),
                 (6, 1),
                 (7, 6),
                 (8, 3),
                 (9, 7),
                 (10, 2),
                 (11, 9),
                 (12, 10),
                 (4, 5);

INSERT INTO INGREDIENT_ALLERGEN (ingredient_id, allergen_id) VALUES
                 (1, 5),   -- Wheat Flour -> Gluten
                 (3, 3),   -- Butter -> Dairy
                 (4, 4),   -- Eggs -> Eggs
                 (6, 3),   -- Cream Cheese -> Dairy
                 (7, 2),   -- Almond Extract -> Tree Nuts
                 (8, 3),   -- Whole Milk -> Dairy
                 (12, 1),  -- Peanut Butter Chips -> Peanuts
                 (13, 6),  -- Soy Lecithin -> Soy
                 (14, 3),  -- Heavy Cream -> Dairy
                 (25, 9),  -- Gelatin -> Fish (often fish-derived)
                 (21, 2),  -- Coconut Flakes -> Tree Nuts (commonly flagged)
                 (16, 5),  -- Baking Powder can contain gluten traces
                 (9, 10),  -- Vanilla Extract -> Sulphites (some formulations)
                 (19, 2),  -- Matcha Powder processed alongside tree nuts (cross-contact)
                 (2, 10),  -- Sugar -> Sulphites (processing aid trace)
                 (6, 4),   -- Cream Cheese also flagged Eggs (shared line)
                 (24, 3),  -- Cream of Tartar -> Dairy (cross-contact facility)
                 (17, 8);  -- Salt processed on shared shellfish-stock line (facility note)

INSERT INTO SUPPLIER_INGREDIENT (supplier_id, ingredient_id, unit_price, lead_time, minimum_order_qty, last_updated) VALUES
                 (1, 1, 0.05, 3, 5000, '2026-06-01'),
                 (1, 2, 0.04, 3, 5000, '2026-06-01'),
                 (2, 3, 0.15, 2, 2000, '2026-06-05'),
                 (2, 6, 0.20, 2, 1000, '2026-06-05'),
                 (2, 8, 0.03, 2, 3000, '2026-06-05'),
                 (3, 4, 0.30, 1, 500, '2026-06-10'),
                 (3, 5, 0.18, 4, 1000, '2026-06-10'),
                 (4, 9, 0.50, 5, 200, '2026-06-12'),
                 (4, 7, 0.60, 5, 100, '2026-06-12'),
                 (5, 23, 0.12, 3, 500, '2026-06-14'),
                 (6, 16, 0.08, 2, 1000, '2026-06-15'),
                 (6, 17, 0.02, 2, 2000, '2026-06-15'),
                 (7, 5, 0.22, 4, 1500, '2026-06-16'),
                 (8, 4, 0.28, 1, 600, '2026-06-18'),
                 (9, 12, 0.35, 3, 300, '2026-06-19'),
                 (9, 7, 0.55, 3, 100, '2026-06-19'),
                 (10, 21, 0.10, 4, 800, '2026-06-20'),
                 (10, 15, 0.14, 3, 400, '2026-06-20');

INSERT INTO FROSTING_INGREDIENT (frosting_id, ingredient_id, quantity) VALUES
                   (1, 3, 200),   -- Buttercream: Butter
                   (1, 2, 150),   -- Buttercream: Sugar
                   (2, 6, 250),   -- Cream Cheese frosting: Cream Cheese
                   (2, 2, 100),   -- Cream Cheese frosting: Sugar
                   (3, 5, 100),   -- Ganache: Cocoa Powder
                   (3, 14, 200),  -- Ganache: Heavy Cream
                   (4, 14, 300),  -- Whipped Cream: Heavy Cream
                   (5, 2, 400),   -- Fondant: Sugar
                   (6, 4, 6),     -- Swiss Meringue: Eggs
                   (6, 2, 250),   -- Swiss Meringue: Sugar
                   (7, 4, 6),     -- Italian Meringue: Eggs
                   (8, 5, 80),    -- Chocolate Buttercream: Cocoa Powder
                   (9, 14, 150),  -- Mascarpone: Heavy Cream
                   (10, 12, 200); -- Peanut Butter Frosting: Peanut Butter Chips

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
                    (4, 4, 4),     -- Lemon Sponge: Eggs
                    (7, 18, 300),  -- Carrot Cake: Carrots
                    (7, 1, 350),   -- Carrot Cake: Flour
                    (7, 23, 5),    -- Carrot Cake: Cinnamon
                    (8, 19, 20),   -- Matcha Sponge: Matcha Powder
                    (8, 1, 350),   -- Matcha Sponge: Flour
                    (9, 20, 15),   -- Coffee Mocha: Coffee Extract
                    (10, 21, 100); -- Coconut Sponge: Coconut Flakes

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
                   (4, 6, 200, 'g'),
                   (7, 1, 300, 'g'),
                   (7, 2, 150, 'g'),
                   (8, 1, 500, 'g'),
                   (8, 17, 10, 'g'),
                   (9, 23, 8, 'g'),
                   (9, 6, 150, 'g'),
                   (10, 18, 200, 'g'),
                   (11, 5, 120, 'g'),
                   (13, 19, 15, 'g'),
                   (14, 11, 10, 'g');

-- ------------------------------------------------------------
-- Inventory
-- ------------------------------------------------------------

INSERT INTO PRODUCT_INVENTORY (branch_id, product_id, name, quantity_on_hand, is_active) VALUES
                 (1, 1, 'Classic Chocolate Birthday Cake', 8, TRUE),
                 (1, 2, 'Vanilla Bean Cupcake (6-pack)', 20, TRUE),
                 (1, 3, 'Butter Croissant', 40, TRUE),
                 (2, 1, 'Classic Chocolate Birthday Cake', 4, TRUE),
                 (2, 4, 'Red Velvet Birthday Cake', 3, TRUE),
                 (3, 1, 'Classic Chocolate Birthday Cake', 4, TRUE),
                 (3, 4, 'Red Velvet Birthday Cake', 5, TRUE),
                 (4, 7, 'Chocolate Chip Cookie (dozen)', 12, TRUE),
                 (4, 8, 'Sourdough Loaf', 10, TRUE),
                 (5, 9, 'Pumpkin Spice Cake (Seasonal)', 6, TRUE),
                 (5, 13, 'Matcha Swiss Roll', 9, TRUE),
                 (6, 10, 'Vegan Carrot Cupcake (6-pack)', 14, TRUE),
                 (6, 11, 'Gluten-Free Brownie Box', 8, TRUE),
                 (7, 12, 'Assorted Pastry Gift Box', 5, TRUE),
                 (7, 14, 'Lemon Meringue Tart', 11, TRUE),
                 (8, 15, 'Mini Wedding Cake (2-tier)', 2, TRUE),
                 (8, 16, 'Rainbow Sprinkle Birthday Cake', 6, TRUE),
                 (9, 3, 'Butter Croissant', 25, TRUE),
                 (9, 2, 'Vanilla Bean Cupcake (6-pack)', 15, TRUE),
                 (10, 6, 'Cannoli', 18, TRUE);

INSERT INTO INGREDIENT_INVENTORY (branch_id, ingredient_id, name, quantity_on_hand, is_active) VALUES
                   (1, 1, 'Wheat Flour', 15000, TRUE),
                   (1, 2, 'Sugar', 12000, TRUE),
                   (1, 3, 'Butter', 8000, TRUE),
                   (1, 4, 'Eggs', 600, TRUE),
                   (2, 1, 'Wheat Flour', 9000, TRUE),
                   (2, 6, 'Cream Cheese', 4000, TRUE),
                   (3, 1, 'Wheat Flour', 7000, TRUE),
                   (3, 5, 'Cocoa Powder', 3000, TRUE),
                   (4, 1, 'Wheat Flour', 6000, TRUE),
                   (4, 17, 'Salt', 2000, TRUE),
                   (5, 19, 'Matcha Powder', 800, TRUE),
                   (5, 23, 'Cinnamon', 500, TRUE),
                   (6, 18, 'Carrots', 3000, TRUE),
                   (6, 5, 'Cocoa Powder', 2500, TRUE),
                   (7, 11, 'Lemon Zest', 1200, TRUE),
                   (7, 14, 'Heavy Cream', 5000, TRUE),
                   (8, 9, 'Vanilla Extract', 2000, TRUE),
                   (8, 10, 'Red Food Coloring', 800, TRUE),
                   (9, 12, 'Peanut Butter Chips', 1500, TRUE),
                   (10, 21, 'Coconut Flakes', 2200, TRUE);

-- ------------------------------------------------------------
-- Custom cakes (built before attaching to orders)
-- ------------------------------------------------------------

-- CUSTOM_CAKE is GENERATED ALWAYS AS IDENTITY -> ids 1-10
INSERT INTO CUSTOM_CAKE (size_id, cake_shape_id, cake_message, special_instructions) VALUES
                     (2, 1, 'Happy Birthday Nicha!', 'Please make the message in gold icing'),
                     (3, 3, 'Congratulations!', 'No nuts at all -- severe allergy'),
                     (1, 2, 'Happy Anniversary', 'Keep it simple, no fondant'),
                     (1, 1, 'Best Day Ever', 'Two-tier, gold accents please'),
                     (2, 2, 'Little Star', 'Kids birthday, bright colors'),
                     (3, 3, 'Congrats on the Promotion!', 'Corporate delivery, plain box'),
                     (2, 1, 'Happy Retirement', 'Photo topper of the office team'),
                     (3, 2, 'Number 30', 'Shaped like the number 30'),
                     (1, 1, 'Get Well Soon', 'Dairy-free frosting requested'),
                     (1, 3, 'Welcome Baby!', 'Pastel colors, floral theme');

INSERT INTO CUSTOM_CAKE_LAYER (layer_number, custom_cake_id, frosting_id, base_id) VALUES
                   (1, 31, 1, 2),   -- Cake 1, layer 1: Buttercream on Chocolate Fudge
                   (2, 31, 1, 1),   -- Cake 1, layer 2: Buttercream on Vanilla Sponge
                   (1, 32, 3, 3),   -- Cake 2, layer 1: Ganache on Red Velvet
                   (1, 33, 4, 1),   -- Cake 3, layer 1: Whipped Cream on Vanilla Sponge
                   (1, 34, 5, 3),   -- Cake 4, layer 1: Fondant on Red Velvet
                   (2, 34, 5, 2),   -- Cake 4, layer 2: Fondant on Chocolate Fudge
                   (1, 35, 6, 1),   -- Cake 5, layer 1: Swiss Meringue on Vanilla Sponge
                   (1, 36, 8, 2),   -- Cake 6, layer 1: Chocolate Buttercream on Chocolate Fudge
                   (1, 37, 9, 9),   -- Cake 7, layer 1: Mascarpone on Coffee Mocha
                   (1, 38, 3, 2),   -- Cake 8, layer 1: Ganache on Chocolate Fudge
                   (1, 39, 4, 1),   -- Cake 9, layer 1: Whipped Cream on Vanilla Sponge (dairy-free substitution noted)
                   (1, 30, 7, 4);  -- Cake 10, layer 1: Italian Meringue on Lemon Sponge

INSERT INTO CUSTOM_CAKE_DECORATION (custom_cake_id, decoration_id, quantity) VALUES
                 (31, 1, 1),   -- Cake 1: Edible Gold Leaf
                 (32, 2, 3),   -- Cake 2: Fresh Flowers x3
                 (33, 6, 2),   -- Cake 3: Sugar Pearls
                 (34, 1, 2),   -- Cake 4: Edible Gold Leaf x2
                 (34, 4, 1),   -- Cake 4: Custom Fondant Topper
                 (35, 11, 1),  -- Cake 5: Character Figurine
                 (36, 3, 1),   -- Cake 6: Chocolate Shavings
                 (37, 10, 1),  -- Cake 7: Fresh Fruit Topping
                 (38, 9, 1),   -- Cake 8: Chocolate Drip
                 (39, 8, 1),   -- Cake 9: Edible Glitter
                 (30, 2, 2),  -- Cake 10: Fresh Flowers x2
                 (30, 5, 1);  -- Cake 10: Macaron Border

INSERT INTO CUSTOM_CAKE_ADDON (custom_cake_id, addon_id, quantity) VALUES
                   (31, 1, 1),   -- Cake 1: Birthday Candle Set
                   (32, 3, 1),   -- Cake 2: Personalized Card
                   (33, 4, 1),   -- Cake 3: Gift Box Packaging
                   (34, 6, 1),   -- Cake 4: Cake Stand Rental
                   (35, 1, 2),   -- Cake 5: Birthday Candle Set x2
                   (36, 3, 1),   -- Cake 6: Personalized Card
                   (37, 9, 1),   -- Cake 7: Photo Print Topper
                   (38, 7, 1),   -- Cake 8: Sparkler Candles
                   (39, 10, 1),  -- Cake 9: Extra Sweetness Reduction
                   (30, 8, 1);  -- Cake 10: Ribbon Wrap

-- ------------------------------------------------------------
-- Orders
-- ------------------------------------------------------------

-- CUSTOMER_ORDER is GENERATED ALWAYS AS IDENTITY -> ids 1-15
INSERT INTO CUSTOMER_ORDER (customer_id, branch_id, pickup_slot_id, order_date, status, subtotal, tax, total_amount, fulfillment_method, shipping_cost) VALUES
                    (1, 1, 1, '2026-07-05', 'Confirmed', 63.50, 4.45, 67.95, 'Pickup', 0.00),
                    (2, 1, 2, '2026-07-06', 'Pending', 15.00, 1.05, 16.05, 'Pickup', 0.00),
                    (3, 2, 3, '2026-07-06', 'Completed', 250.00, 17.50, 267.50, 'Delivery', 15.00),
                    (4, 1, 4, '2026-07-07', 'Confirmed', 45.00, 3.15, 48.15, 'Pickup', 0.00),
                    (5, 3, 5, '2026-07-08', 'In Production', 78.00, 5.46, 83.46, 'Delivery', 12.00),
                    (6, 3, 6, '2026-07-08', 'Ready', 32.00, 2.24, 34.24, 'Pickup', 0.00),
                    (7, 4, 7, '2026-07-09', 'Pending', 22.00, 1.54, 23.54, 'Pickup', 0.00),
                    (8, 5, 8, '2026-07-09', 'Confirmed', 90.00, 6.30, 96.30, 'Delivery', 10.00),
                    (9, 6, 9, '2026-07-10', 'Cancelled', 18.00, 1.26, 19.26, 'Pickup', 0.00),
                    (10, 7, 10, '2026-07-10', 'Completed', 60.00, 4.20, 64.20, 'Delivery', 8.00),
                    (11, 8, 11, '2026-07-11', 'Confirmed', 150.00, 10.50, 160.50, 'Pickup', 0.00),
                    (12, 9, 12, '2026-07-11', 'Pending', 30.00, 2.10, 32.10, 'Pickup', 0.00),
                    (1, 2, 14, '2026-07-12', 'Confirmed', 20.00, 1.40, 21.40, 'Delivery', 9.00),
                    (3, 1, 1, '2026-07-13', 'Ready', 55.50, 3.89, 59.39, 'Pickup', 0.00),
                    (5, 5, 15, '2026-07-14', 'Pending', 44.00, 3.08, 47.08, 'Delivery', 11.00);

-- ORDER_ITEM is GENERATED ALWAYS AS IDENTITY -> ids 1-20
INSERT INTO ORDER_ITEM (order_id, item_type, quantity, unit_price) VALUES
                   (1, 'custom_cake', 1, 51.50),   -- order 1: custom cake 1
                   (1, 'product', 1, 12.00),       -- order 1: cookies
                   (2, 'product', 1, 15.00),       -- order 2: cupcakes
                   (3, 'product', 1, 250.00),      -- order 3: wedding cake
                   (4, 'custom_cake', 1, 45.00),   -- order 4: custom cake 3
                   (5, 'custom_cake', 1, 78.00),   -- order 5: custom cake 4
                   (6, 'product', 1, 32.00),       -- order 6: red velvet cake
                   (7, 'product', 1, 22.00),       -- order 7: matcha swiss roll
                   (8, 'custom_cake', 1, 60.00),   -- order 8: custom cake 5
                   (8, 'product', 1, 30.00),       -- order 8: rainbow cake
                   (9, 'product', 1, 18.00),       -- order 9: vegan carrot cupcakes
                   (10, 'custom_cake', 1, 60.00),  -- order 10: custom cake 6
                   (11, 'product', 1, 150.00),     -- order 11: mini wedding cake
                   (12, 'product', 1, 30.00),      -- order 12: rainbow sprinkle cake
                   (13, 'product', 1, 20.00),      -- order 13: gluten-free brownie box
                   (14, 'custom_cake', 1, 55.50),  -- order 14: custom cake 7
                   (15, 'custom_cake', 1, 44.00),  -- order 15: custom cake 8
                   (2, 'product', 1, 3.50),        -- order 2: croissant add-on item
                   (6, 'product', 1, 5.00),        -- order 6: cannoli add-on item
                   (9, 'product', 1, 8.00);        -- order 9: lemon meringue tart add-on item

INSERT INTO ORDER_ITEM_CUSTOM_CAKE (order_item_id, custom_cake_id, quantity) VALUES
                 (1, 31, 1),
                 (5, 33, 1),
                 (6, 34, 1),
                 (9, 35, 1),
                 (12, 36, 1),
                 (16, 37, 1),
                 (17, 38, 1);

INSERT INTO ORDER_ITEM_PRODUCT (order_item_id, product_id) VALUES
                   (2, 7),
                   (3, 2),
                   (4, 5),
                   (7, 6),
                   (8, 13),
                   (10, 16),
                   (11, 10),
                   (13, 15),
                   (14, 16),
                   (15, 11),
                   (18, 3),
                   (19, 6),
                   (20, 14);

-- ------------------------------------------------------------
-- Payment & delivery
-- ------------------------------------------------------------

INSERT INTO PAYMENT (order_id, payment_method, amount, paid_at, status) VALUES
                (1, 'Credit Card', 67.95, '2026-07-05', 'Paid'),
                (2, 'PromptPay', 16.05, NULL, 'Pending'),
                (3, 'Credit Card', 267.50, '2026-07-06', 'Paid'),
                (4, 'Cash', 48.15, '2026-07-07', 'Paid'),
                (5, 'PromptPay', 83.46, '2026-07-08', 'Paid'),
                (6, 'Credit Card', 34.24, '2026-07-08', 'Paid'),
                (7, 'Cash', 23.54, NULL, 'Pending'),
                (8, 'Credit Card', 96.30, '2026-07-09', 'Paid'),
                (9, 'PromptPay', 19.26, NULL, 'Refunded'),
                (10, 'Credit Card', 64.20, '2026-07-10', 'Paid'),
                (11, 'Cash', 160.50, '2026-07-11', 'Paid'),
                (12, 'PromptPay', 32.10, NULL, 'Pending'),
                (13, 'Credit Card', 21.40, '2026-07-12', 'Paid'),
                (14, 'Credit Card', 59.39, NULL, 'Failed'),
                (15, 'PromptPay', 47.08, NULL, 'Pending');

INSERT INTO DELIVERY (order_id, address_id, driver, status, estimated_delivery_time) VALUES
                 (3, 3, 'Somchai T.', 'Delivered', '15:30:00'),
                 (5, 5, 'Anucha P.', 'Out for Delivery', '12:00:00'),
                 (8, 7, 'Wichai S.', 'Pending', '17:30:00'),
                 (10, 9, 'Somchai T.', 'Delivered', '14:00:00'),
                 (13, 1, 'Anucha P.', 'Pending', '10:30:00'),
                 (15, 5, 'Wichai S.', 'Pending', '18:00:00');