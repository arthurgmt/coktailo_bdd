class Config:
    SQLALCHEMY_DATABASE_URI = 'postgresql://username:password@localhost/cocktails'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    JWT_SECRET_KEY = 'our_jwt_secret_key'
