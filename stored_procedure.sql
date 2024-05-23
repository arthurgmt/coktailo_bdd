-- Procedure to get a cocktail by ingredient
CREATE OR REPLACE FUNCTION get_cocktail_by_ingredient(ingredient_name VARCHAR)
RETURNS TABLE(cocktail_name VARCHAR, instructions TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT c.name, c.instructions
    FROM cocktails c
    JOIN cocktail_ingredients ci ON c.id = ci.cocktail_id
    JOIN ingredients i ON ci.ingredient_id = i.id
    WHERE i.name = ingredient_name;
END;
$$ LANGUAGE plpgsql;
