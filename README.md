# ERCOT Vector Store RAG

A production-ready Retrieval Augmented Generation (RAG) system built with Langflow for querying ERCOT (Electric Reliability Council of Texas) data. This solution combines vector search with conversational AI to provide intelligent answers about ERCOT operations, regulations, and data.

## 🌟 Features

- **Dual-Flow Architecture**: Separate data ingestion and retrieval flows for optimal performance
- **Vector Database**: Powered by AstraDB for scalable document storage and similarity search
- **Multiple AI Models**: Support for OpenAI GPT and xAI Grok models
- **Conversation Memory**: Maintains chat history for contextual conversations
- **Flexible Data Sources**: Supports multiple file formats (TXT, PDF, DOCX, etc.)
- **Smart Text Processing**: Intelligent document chunking and parsing

## 🏗️ Architecture

### 1. Data Ingestion Flow (📚 Load Data)
- **File Input**: Loads documents from local files or ZIP archives
- **Text Splitting**: Chunks documents with configurable overlap
- **Embedding Generation**: Creates vector embeddings using OpenAI models
- **Vector Storage**: Stores embeddings in AstraDB collection

### 2. Retrieval Flow (🔍 Query & Chat)
- **Chat Interface**: Natural language query input
- **Vector Search**: Semantic similarity search in AstraDB
- **Context Integration**: Combines retrieved documents with chat history
- **AI Response**: Generates contextual answers using LLMs

## 🚀 Quick Start

### Prerequisites

- Python 3.8+
- Langflow installed
- OpenAI API key
- AstraDB account and API token
- xAI API key (optional, for Grok model)

### Installation

1. **Clone the repository**:
```bash
git clone https://github.com/yourusername/ercot-vector-store-rag.git
cd ercot-vector-store-rag
```

2. **Install dependencies**:
```bash
pip install -r requirements.txt
```

3. **Set up environment variables**:
```bash
cp .env.example .env
# Edit .env with your API keys
```

4. **Import the flow into Langflow**:
```bash
# Start Langflow
langflow run

# Import the flow file
# Go to Langflow UI -> Import -> Select "ERCOT Vector Store RAG.json"
```

### Configuration

1. **Add API Keys** in Langflow:
   - OpenAI API Key for embeddings and chat
   - AstraDB Application Token
   - xAI API Key (if using Grok)

2. **Configure Database**:
   - Select your AstraDB database
   - Choose or create a collection (e.g., "ERCOT_text")

3. **Upload Data**:
   - Add your ERCOT documents to the File component
   - Run the Load Data flow first

## 📖 Usage

### Loading Data

1. Navigate to the **📚 Load Data Flow**
2. Upload your ERCOT documents via the File component
3. Configure text chunking parameters if needed
4. Click **▶️ Run** on the AstraDB component to ingest data

### Querying Data

1. Switch to the **🔍 Retriever Flow**
2. Open the Playground
3. Ask questions like:
   - "What is ERCOT's role in the Texas electricity market?"
   - "How does ERCOT manage grid reliability?"
   - "What are the key ERCOT operating procedures?"

### Example Queries

```
User: What is ERCOT and what does it do?
Assistant: ERCOT (Electric Reliability Council of Texas) is the independent system operator for the Texas electric grid...

User: How does ERCOT handle emergency situations?
Assistant: Based on ERCOT's emergency procedures, the organization has several protocols in place...
```

## 🛠️ Customization

### Adjusting Search Parameters

- **Number of Results**: Control how many documents to retrieve
- **Search Score Threshold**: Set minimum similarity scores
- **Chunk Size**: Modify document splitting parameters
- **Temperature**: Adjust AI response creativity

### Adding New Data Sources

1. Supported formats: TXT, MD, PDF, DOCX, CSV, JSON, HTML
2. Add files to the File component
3. Re-run the ingestion flow

### Model Configuration

- **Embeddings**: OpenAI text-embedding-3-small/large
- **Chat Models**: 
  - OpenAI GPT-3.5/4
  - xAI Grok-3-latest

## 📁 Project Structure

```
ercot-vector-store-rag/
├── flows/
│   ├── ERCOT Vector Store RAG.json    # Main Langflow export
│   └── components/                     # Custom components (if any)
├── data/
│   ├── sample/                        # Sample ERCOT documents
│   └── processed/                     # Processed data cache
├── docs/
│   ├── setup.md                      # Detailed setup instructions
│   ├── api.md                        # API documentation
│   └── troubleshooting.md            # Common issues and solutions
├── scripts/
│   ├── data_ingestion.py             # Batch data processing
│   └── export_flow.py                # Flow export utilities
├── tests/
│   ├── test_ingestion.py             # Ingestion tests
│   └── test_retrieval.py             # Retrieval tests
├── requirements.txt                   # Python dependencies
├── .env.example                      # Environment variables template
├── .gitignore                        # Git ignore rules
└── README.md                         # This file
```

## 🔧 Configuration Options

### AstraDB Settings
- **Database**: Your AstraDB instance
- **Collection**: Vector storage collection
- **Embedding Model**: text-embedding-3-small (default)
- **Search Method**: Vector Search or Hybrid Search

### Text Processing
- **Chunk Size**: 1000 characters (default)
- **Chunk Overlap**: 200 characters (default)
- **Separator**: Newline (configurable)

### AI Models
- **Primary**: xAI Grok-3-latest
- **Fallback**: OpenAI GPT models
- **Temperature**: 0.1 (for consistent responses)

## 🔍 Troubleshooting

### Common Issues

1. **API Key Errors**:
   - Verify all API keys are correctly set
   - Check key permissions and quotas

2. **Database Connection**:
   - Ensure AstraDB database is active
   - Verify collection exists and is accessible

3. **No Search Results**:
   - Check if data was properly ingested
   - Verify embedding model consistency
   - Adjust search parameters

4. **Performance Issues**:
   - Optimize chunk sizes for your data
   - Adjust number of search results
   - Consider hybrid search for better relevance

## 📚 Documentation

- [Detailed Setup Guide](docs/setup.md)
- [API Reference](docs/api.md)
- [Troubleshooting Guide](docs/troubleshooting.md)
- [Langflow Documentation](https://docs.langflow.org/)
- [AstraDB Documentation](https://docs.datastax.com/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Langflow](https://langflow.org/) for the visual RAG framework
- [DataStax AstraDB](https://astra.datastax.com/) for vector database
- [OpenAI](https://openai.com/) for embeddings and language models
- [xAI](https://x.ai/) for the Grok language model
- ERCOT for providing comprehensive grid operation data

## 📞 Support

- 📧 Email: vsrinikhil@gmail.com
- 🐛 Issues: [GitHub Issues](https://github.com/yourusername/ercot-vector-store-rag/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/yourusername/ercot-vector-store-rag/discussions)

---

⚡ **Built for the Texas Grid** - Empowering better understanding of ERCOT operations through intelligent document retrieval.
