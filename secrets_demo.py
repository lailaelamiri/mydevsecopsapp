import os

# Good practice: read secrets from environment variables
db_password = os.environ.get("DB_PASSWORD", "not-set")
api_key = os.environ.get("API_KEY", "not-set")

print(f"DB Password loaded: {'✅' if db_password != 'not-set' else '❌'}")
print(f"API Key loaded: {'✅' if api_key != 'not-set' else '❌'}")