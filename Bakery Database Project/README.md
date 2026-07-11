# Database Functions

Stored functions/procedures for the bakery app's business logic layer, grouped by domain.

## Custom Cake Builder
| Function                        | Purpose                                                                         |
|---------------------------------|---------------------------------------------------------------------------------|
| add_cake_addon.sql              | Add an addon to a custom cake order                                             |
| add_cake_decorations.sql        | Add an decoration to a custom cake order                                        |
| add_cake_layer.sql              | Add a layer to a custom cake order                                              |
| add_custom_cake_to_order.sql    | Add a custom cake to an order                                                   |
| calculate_custom_cake_price.sql | Calculate the total cost of an order                                            |
| check_custom_cake_allergens.sql | Flag allergen conflicts between a cake's ingredients and a customer's allergens |
| create_custom_cake.sql          | Create a new custom cake order                                                  |
| get_custom_cake_summary.sql     | Get a summary of a custom cake order                                            |
| remove_cake_layer.sql           | Remove a layer from a custom cake order                                         |
| remove_cake_decoration.sql      | Remove a decoration from a custom cake order                                    |
| remove_cake_addon.sql           | Remove an addon from a custom cake order                                        |


## Customer Account
| Function                       | Purpose                                      |
|--------------------------------|----------------------------------------------|
| add_customer_address.sql       | Add a new address for the customer           |
| get_customer_address.sql       | Get customer's address details               |
| get_customer_order_history.sql | Get the order history of a customer          |
| get_login_customer.sql         | Look up a customer record by login/user      |
| record_customer_login.sql      | Updates last login                           |
| register_customer.sql          | Register new customer                        |

## Branch & Fulfillment
| Function                       | Purpose                                            |
|--------------------------------|----------------------------------------------------|
| get_available_pickup_slots.sql | Gathers all available pickup timeslots of a branch |
| get_branch_order_queue.sql     | Gathers all order queue of a branch a specific day |
| get_branch_sales_report.sql    | Sales summary for a branch over a period           |
| is_pickup_slot_available.sql   | Checks whether pickup slot is still available      |

## Inventory & Supply Chain
| Function                             | Purpose                                                 |
|--------------------------------------|---------------------------------------------------------|
| deduct_ingredients_for_product.sql   | Reduce ingredient stock when a product is made          |
| get_best_supplier_for_ingredient.sql | Find the best-priced supplier for an ingredient         |
| get_low_stock_ingredients.sql        | Get all ingredients that are below a re-order threshold |
| restock_ingredient.sql               | Restock ingredient quantity                             |
| restock_product.sql                  | Restock product quantity                                |

## Order Management
| Function                 | Purpose                             |
|--------------------------|-------------------------------------|
| add_product_to_order.sql | Add a new product to customer order |
| cancel_order.sql         | Cancels an order                    |
| create_order.sql         | Create new order                    |
| finalize_order.sql       | Confirms order and get total        |
| get_order_details.sql    | Show details of an order            |
| update_order_status.sql  | Change an order status              |

## Product Catalog
| Function                         | Purpose                                                                              |
|----------------------------------|--------------------------------------------------------------------------------------|
| add_product.sql                  | Add a new product to bakery catalog                                                  |
| browse_products_for_customer.sql | Returns all active products, optionally filtered to one category and shows allergens |
| deactivate_product.sql           | Set is_acctive to false for a discontinued product                                   |
| get_available_product_image.sql  | Get product picture link                                                             |
| get_top_selling_products.sql     | Get top selling product during a certain period                                      |
| update_product_price.sql         | Updates product price                                                                |


