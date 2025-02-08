import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from app.db import db  # Ensure db is imported correctly

def create_app():
    app = Flask(__name__)

    # Load configuration from environment variables
    app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL', 'sqlite:///students.db')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    # Initialize database
    db.init_app(app)
    migrate = Migrate(app, db)  # Initialize Flask-Migrate

    # Register Blueprints
    from app.routes import api
    app.register_blueprint(api)

    return app
