--sign up
--customer will be able to sign up with their name, email, password, location, and state
INSERT INTO customer_table(name, email, password, location, state)
VALUES ('John Doe', 'john.doe@example.com', 'securepassword123', 'New York', 'NY');

-- If the user is already there, the  it wont be added again.
SELECT *
FROM customer_table
IF NOT EXISTS (
SELECT 1 
FROM customer_table 
WHERE email = 'john.doe@example.com' ) ;


--user profile
Select *
FROM customer_table;

--There  are many things that can be added to the user profile like the cart items, order history, etc 
--but to make it easy we have not added more data else there are so many changes we have to do for 
--each table and generating the data is also diffucult which can lead us to multiple errors, 
--so for now we are just taking user some basic details only.


--product_details 
--seller point of view: he will be adding products to the collection and the clothing items for the buyer to view
INSERT INTO collection_table(name, type, colour, price)
VALUES ('Street style', 'Seasonal', 'Black', 250);

INSERT INTO clothing_item_table(name, type, size, colour)
VALUES ('Shorts', 'Comfort to wear', 250, 100);

--Product_details(buyer point of view: customer will be adding products to the cart)
--customer will be adding products to the cart from the collection table and the clothing item table
SELECT id
FROM collection_table;

SELECT id
FROM clothing_item_table;

SELECT *
FROM collection_table;

--if the product is selected then it will be added to the cart by the primary key which is id.
INSERT INTO cart_table(customer_id, item_id, quantity)
VALUES (1, 1, 1);

--product_search: the customer will be able to search for products by name, type, colour, and price
SELECT *
FROM collection_table
JOIN clothing_item_table ON collection_table.collection_id = clothing_item_table.item_id
JOIN Customized_table ON collection_table.collection_id = Customized_table.custom_id
WHERE clothing_item_table.name LIKE '%search_name%'
  AND clothing_item_table.type LIKE '%search_type%'
  AND clothing_item_table.color LIKE '%search_color%'
  AND clothing_item_table.price <= search_price;

--If the user doesn't specify a search_name, search_type, search_color, or search_price, then all products
--will be returned and if he choose any one of them then based on the particular search it will filter out the data.

--add_to_cart
--the customer will be able to add products to the cart
--It will help to add the price by id from the table
INSERT INTO cart_table(customer_id, item_id)
VALUES (1, 1);

--view_cart: the customer will be able to view the products in the cart
SELECT *
FROM cart_table;

--place_order: the customer will be able to place an order
--Calculate the total amount for the order by summing the prices of all items in the cart for a specific customer
INSERT INTO order_table(customer_id, total_amount)
VALUES (1, (SELECT SUM(price) FROM cart_table WHERE customer_id = 1));

DELETE FROM cart_table
WHERE customer_id = 1;

--Once the order is placed, the items from the customer's cart will be removed.


--order_history: the customer will be able to view their order history
SELECT *
FROM order_table
WHERE customer_id = 1;  --customer_id is the id of the customer who placed the order