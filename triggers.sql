-- Function to update inventory after inserting into cocktail_ingredients
CREATE OR REPLACE FUNCTION update_inventory()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.quantity > 0 THEN
        UPDATE ingredients SET quantity = quantity - NEW.quantity
        WHERE id = NEW.ingredient_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to call update_inventory after insert on cocktail_ingredients
CREATE TRIGGER trg_update_inventory
AFTER INSERT ON cocktail_ingredients
FOR EACH ROW EXECUTE FUNCTION update_inventory();
