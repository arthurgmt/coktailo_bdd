from flask import request, jsonify
from app import app, db, bcrypt
from app.models import User, Cocktail, Ingredient, CocktailIngredient
from flask_jwt_extended import create_access_token, jwt_required, get_jwt_identity

@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    hashed_password = bcrypt.generate_password_hash(data['password']).decode('utf-8')
    new_user = User(username=data['username'], email=data['email'], password=hashed_password)
    db.session.add(new_user)
    db.session.commit()
    return jsonify({'message': 'Registered successfully'}), 201

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    user = User.query.filter_by(username=data['username']).first()
    if user and bcrypt.check_password_hash(user.password, data['password']):
        access_token = create_access_token(identity=user.id)
        return jsonify(access_token=access_token), 200
    return jsonify({'message': 'Invalid credentials'}), 401

@app.route('/cocktails', methods=['GET'])
def get_cocktails():
    cocktails = Cocktail.query.all()
    return jsonify([cocktail.to_dict() for cocktail in cocktails]), 200

@app.route('/cocktail', methods=['POST'])
@jwt_required()
def add_cocktail():
    data = request.get_json()
    current_user_id = get_jwt_identity()
    new_cocktail = Cocktail(
        name=data['name'],
        description=data['description'],
        instructions=data['instructions'],
        country=data['country'],
        main_alcohol=data['main_alcohol'],
        user_id=current_user_id
    )
    db.session.add(new_cocktail)
    db.session.commit()
    for ing in data['ingredients']:
        ingredient = Ingredient.query.filter_by(name=ing['name']).first()
        if not ingredient:
            ingredient = Ingredient(name=ing['name'])
            db.session.add(ingredient)
            db.session.commit()
        cocktail_ingredient = CocktailIngredient(
            cocktail_id=new_cocktail.id,
            ingredient_id=ingredient.id,
            quantity=ing['quantity']
        )
        db.session.add(cocktail_ingredient)
        db.session.commit()
    return jsonify({'message': 'Cocktail added successfully'}), 201
