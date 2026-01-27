use ch54_monkys_tower;
SELECT 
    users.id AS user_id,
    users.email,
    orders.id AS order_id,
    order_items.product_id
FROM 
    users
INNER JOIN 
    orders ON orders.user_id = users.id
INNER JOIN 
    order_items ON order_items.order_id = orders.id;