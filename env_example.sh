# OpenAI Configuration
OPENAI_API_KEY=your_openai_api_key_here

# xAI Configuration (for Grok models)
XAI_API_KEY=your_xai_api_key_here

# AstraDB Configuration
ASTRA_DB_APPLICATION_TOKEN=your_astra_db_token_here
ASTRA_DB_API_ENDPOINT=https://your-database-id-region.apps.astra.datastax.com
ASTRA_DB_KEYSPACE=default_keyspace

# Langflow Configuration
LANGFLOW_HOST=0.0.0.0
LANGFLOW_PORT=7860
LANGFLOW_WORKERS=1

# Optional: Database Configuration
DATABASE_URL=sqlite:///./langflow.db

# Optional: Logging
LOG_LEVEL=INFO
LOG_FILE=logs/app.log

# Optional: Cache Configuration
CACHE_TYPE=memory
REDIS_URL=redis://localhost:6379

# Optional: Security
SECRET_KEY=your_secret_key_for_sessions
ALLOWED_HOSTS=localhost,127.0.0.1

# Development Settings
DEBUG=False
ENVIRONMENT=production