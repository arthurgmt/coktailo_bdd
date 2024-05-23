class Config:
    SQLALCHEMY_DATABASE_URI = 'postgresql://citus:citus@localhost:5432/citus'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    JWT_SECRET_KEY = 'your_jwt_secret_key'
