# ERCOT Vector Store RAG - Setup Guide

This guide provides detailed instructions for setting up the ERCOT Vector Store RAG system.

## Prerequisites

### System Requirements
- Python 3.8 or higher
- 4GB+ RAM (8GB+ recommended)
- 2GB+ free disk space
- Stable internet connection

### Required API Keys and Services

1. **OpenAI Account**
   - Sign up at [OpenAI](https://platform.openai.com/)
   - Generate API key from API Keys section
   - Ensure you have credits available

2. **AstraDB Account**
   - Sign up at [DataStax Astra](https://astra.datastax.com/)
   - Create a new database (Vector Database)
   - Generate application token with Database Administrator role

3. **xAI Account (Optional)**
   - Sign up at [xAI](https://x.ai/)
   - Generate API key for Grok models

## Installation Steps

### 1. Clone and Setup Repository

```bash
# Clone the repository
git clone https://github.com/yourusername/ercot-vector-store-rag.git
cd ercot-vector-store-rag

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

### 2. Environment Configuration

```bash
# Copy environment template
cp .env.example .env

# Edit .env file with your credentials
nano .env  # or use your preferred editor
```

Fill in the following required variables:
```env
OPENAI_API_KEY=sk-your-openai-key-here
ASTRA_DB_APPLICATION_TOKEN=AstraCS:your-token-here
XAI_API_KEY=your-xai-key-here  # Optional
```

### 3. AstraDB Database Setup

#### Create Database
1. Log into [Astra Console](https://astra.datastax.com/)
2. Click "Create Database"
3. Choose:
   - **Database name**: `ercot-rag-db` (or your preferred name)
   - **Keyspace**: `default_keyspace`
   - **Cloud Provider**: Your preference
   - **Region**: Closest to your location
4. Wait for database to become ACTIVE

#### Get Database Endpoint
1. In your database dashboard, go to "Connect" tab
2. Copy the API Endpoint URL
3. Add to your `.env` file:
```env
ASTRA_DB_API_ENDPOINT=https://your-database-id-region.apps.astra.datastax.com
```

### 4. Install and Start Langflow

```bash
# Install Langflow (if not already installed)
pip install langflow

# Start Langflow
langflow run --host 0.0.0.0 --port 7860
```

Langflow will be available at: `http://localhost:7860`

### 5. Import the Flow

1. Open Langflow in your browser
2. Click "New Project" or "Import"
3. Select "Import from JSON"
4. Upload the `flows/ERCOT Vector Store RAG.json` file
5. Click "Import"

## Configuration

### 1. Configure API Keys in Langflow

For each component that requires API keys:

#### OpenAI Embeddings Components
1. Click on the OpenAI Embeddings component
2. Find "OpenAI API Key" field
3. Enter your OpenAI API key or use global variable `OPENAI_API_KEY`

#### AstraDB Components
1. Click on the AstraDB component
2. Configure:
   - **Astra DB Application Token**: Your token or `ASTRA_DB_APPLICATION_TOKEN`
   - **Database**: Select your database from dropdown
   - **Collection**: Choose existing or create new (e.g., "ERCOT_text")

#### xAI Model Component
1. Click on the xAI component
2. Enter your xAI API key or use `XAI_API_KEY`

### 2. Database and Collection Setup

#### Option A: Use Existing Collection
- Select from the dropdown in AstraDB component

#### Option B: Create New Collection
1. In AstraDB component, click "Create new collection"
2. Enter:
   - **Name**: `ERCOT_text`
   - **Embedding Provider**: "Bring your own"
   - **Dimensions**: 1536 (for OpenAI text-embedding-3-small)

### 3. Configure Text Processing

#### File Component
- **Processing Concurrency**: 4 (default)
- **Silent Errors**: false (recommended)

#### Split Text Component
- **Chunk Size**: 1000 (adjust based on your documents)
- **Chunk Overlap**: 200
- **Separator**: `\n` (newline)

#### Search Parameters
- **Number of Results**: 4 (adjust based on needs)
- **Search Type**: "Similarity"
- **Search Score Threshold**: 0 (adjust for quality filtering)

## Data Preparation

### 1. Prepare ERCOT Documents

Supported formats:
- `.txt` - Plain text files
- `.pdf` - PDF documents
- `.docx` - Word documents
- `.md` - Markdown files
- `.csv` - CSV files
- `.json` - JSON files
- `.html` - HTML files

### 2. Upload Documents

1. In the Load Data Flow, find the File component
2. Click "Upload Files" or drag and drop
3. Select your ERCOT documents
4. Verify files are loaded correctly

## Testing the Setup

### 1. Test Data Ingestion

1. Navigate to the "📚 Load Data Flow"
2. Ensure files are uploaded to File component
3. Click "▶️ Run" on the AstraDB component
4. Verify documents are processed and stored
5. Check the collection in AstraDB console

### 2. Test Retrieval Flow

1. Switch to "🔍 Retriever Flow"
2. Open Playground
3. Try test queries:
   ```
   What is ERCOT?
   How does ERCOT manage the Texas grid?
   What are ERCOT's emergency procedures?
   ```

### 3. Verify Components

Check each component shows green status:
- ✅ File input loaded
- ✅ Text splitting completed
- ✅ Embeddings generated
- ✅ Vector storage successful
- ✅ Search functioning
- ✅ AI responses generated

## Troubleshooting Setup Issues

### Common Problems

#### 1. API Key Errors
```
Error: Incorrect API key provided
```
**Solution**: 
- Verify API key is correct and active
- Check key has proper permissions
- Ensure no extra spaces in `.env` file

#### 2. Database Connection Issues
```
Error: Unable to connect to AstraDB
```
**Solution**:
- Verify database is ACTIVE status
- Check API endpoint URL is correct
- Ensure application token has proper permissions

#### 3. Import Errors
```
Error: Unable to import flow
```
**Solution**:
- Verify Langflow version compatibility (1.4.2+)
- Check JSON file is not corrupted
- Try importing individual components

#### 4. Memory Issues
```
Error: Out of memory during processing
```
**Solution**:
- Reduce chunk size in Split Text component
- Process fewer files at once
- Increase system RAM if possible
- Use file processing concurrency of 1

### Performance Optimization

#### For Large Document Sets
1. **Batch Processing**: Process documents in smaller batches
2. **Chunk Size Optimization**: Start with 500-1000 characters
3. **Overlap Reduction**: Use 100-200 character overlap
4. **Parallel Processing**: Increase concurrency for faster uploads

#### For Better Search Results
1. **Increase Search Results**: Try 6-10 results
2. **Adjust Score Threshold**: Use 0.7-0.8 for higher quality
3. **Optimize Chunks**: Smaller chunks for specific queries
4. **Use Hybrid Search**: If available in your AstraDB setup

## Next Steps

1. **Upload Your Data**: Add your specific ERCOT documents
2. **Customize Prompts**: Modify the prompt template for your use case
3. **Tune Parameters**: Adjust search and generation parameters
4. **Test Extensively**: Try various query types and edge cases
5. **Monitor Performance**: Track response times and accuracy

## Support

If you encounter issues during setup:

1. Check the [Troubleshooting Guide](troubleshooting.md)
2. Review Langflow logs in the console
3. Verify all prerequisites are met
4. Open an issue on GitHub with error details

---

🎉 **Setup Complete!** Your ERCOT Vector Store RAG system is ready to use.