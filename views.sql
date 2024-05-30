-- Vue pour les cocktails avec alcool
CREATE VIEW alcoholic_cocktails AS
SELECT c.id, c.name, c.description, c.instructions, c.country, c.main_alcohol, c.user_id
FROM cocktails c
JOIN cocktail_ingredients ci ON c.id = ci.cocktail_id
JOIN ingredients i ON ci.ingredient_id = i.id
WHERE i.name IN ('vodka', 'rum', 'gin', 'tequila', 'whiskey', 'brandy', 'cognac');  -- Liste des alcools principaux


-- Vue pour les cocktails sans alcool
CREATE VIEW non_alcoholic_cocktails AS
SELECT c.id, c.name, c.description, c.instructions, c.country, c.main_alcohol, c.user_id
FROM cocktails c
LEFT JOIN cocktail_ingredients ci ON c.id = ci.cocktail_id
LEFT JOIN ingredients i ON ci.ingredient_id = i.id
WHERE c.main_alcohol IS NULL OR c.main_alcohol NOT IN ('vodka', 'rum', 'gin', 'tequila', 'whiskey', 'brandy', 'cognac');


-- Vue pour les cocktails classiques
CREATE VIEW classic_cocktails AS
SELECT c.id, c.name, c.description, c.instructions, c.country, c.main_alcohol, c.user_id
FROM cocktails c
WHERE c.name IN ('Mojito', 'Martini', 'Old Fashioned', 'Margarita', 'Cosmopolitan');  -- Liste des cocktails classiques


-- Vue pour les cocktails modernes
CREATE VIEW modern_cocktails AS
SELECT c.id, c.name, c.description, c.instructions, c.country, c.main_alcohol, c.user_id
FROM cocktails c
WHERE c.name NOT IN ('Mojito', 'Martini', 'Old Fashioned', 'Margarita', 'Cosmopolitan');  -- Exclure les classiques pour inclure les modernes


-- Vue pour les cocktails saisonniers
CREATE VIEW seasonal_cocktails AS
SELECT c.id, c.name, c.description, c.instructions, c.country, c.main_alcohol, c.user_id
FROM cocktails c
WHERE c.name IN ('Pumpkin Spice Martini', 'Winter Wonderland', 'Summer Breeze', 'Autumn Punch');  -- Liste des cocktails saisonniers


-- Vue globale pour tous les cocktails
CREATE VIEW all_cocktails AS
SELECT * FROM alcoholic_cocktails
UNION ALL
SELECT * FROM non_alcoholic_cocktails
UNION ALL
SELECT * FROM classic_cocktails
UNION ALL
SELECT * FROM modern_cocktails
UNION ALL
SELECT * FROM seasonal_cocktails;

