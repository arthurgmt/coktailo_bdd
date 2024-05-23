-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

-- Create ingredients table
CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create cocktails table
CREATE TABLE cocktails (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    instructions TEXT,
    country VARCHAR(50),
    main_alcohol VARCHAR(50),
    user_id INT REFERENCES users(id)
);

-- Create cocktail_ingredients table
CREATE TABLE cocktail_ingredients (
    cocktail_id INT REFERENCES cocktails(id),
    ingredient_id INT REFERENCES ingredients(id),
    quantity VARCHAR(50),
    PRIMARY KEY (cocktail_id, ingredient_id)
);
