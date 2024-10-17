-- creates a trigger that decreases the quantity of an item
DROP TRIGGER IF EXISTS reduce_quantity;

DELIMITER $$

CREATE TRIGGER reduce_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - 1
    WHERE id = NEW.item_id;
END 
$$

DELIMITER;