# Neo4j Financial Data Graph RAG

A project demonstrating Graph Retrieval-Augmented Generation (RAG) using Neo4j and real-time financial data from Yahoo Finance.

## Overview

This project ingests financial data (companies, sectors) into a Neo4j graph database and demonstrates graph traversal for RAG context retrieval. It's designed to showcase how graph databases can enhance AI/ML workflows by providing structured, relationship-rich context.

## Features

- 🔗 Neo4j graph database integration
- 📊 Real-time financial data ingestion from Yahoo Finance
- 🔍 Graph-based retrieval for RAG applications
- 🐳 Docker-based Neo4j deployment
- 📓 Jupyter notebook examples

## Prerequisites

- Docker and Docker Compose
- Python 3.8+
- pip

## Setup

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd testNoSQL
```

### 2. Configure Environment Variables

Copy the example environment file and set your Neo4j password:

```bash
cp .env.example .env
```

Edit `.env` and change the password:

```
NEO4J_PASSWORD=your_secure_password_here
```

### 3. Start Neo4j with Docker

```bash
cd docker
chmod +x neo4j.sh
./neo4j.sh
```

This will start Neo4j on:
- Browser UI: http://localhost:7474
- Bolt connection: bolt://localhost:7687

### 4. Install Python Dependencies

```bash
pip install neo4j yfinance python-dotenv
```

## Usage

### Running the Jupyter Notebook

1. Start Jupyter:
   ```bash
   jupyter notebook
   ```

2. Open `docker/test-neo4j.ipynb`

3. Run the cells to:
   - Install dependencies
   - Connect to Neo4j
   - Ingest financial data
   - Query the graph for RAG context

### Example Code

```python
import os
from neo4j import GraphDatabase
from dotenv import load_dotenv

load_dotenv()

URI = "bolt://localhost:7687"
AUTH = ("neo4j", os.getenv("NEO4J_PASSWORD"))
driver = GraphDatabase.driver(URI, auth=AUTH)

# Ingest data
ingest_financial_data(["AAPL", "MSFT", "TSLA"])

# Retrieve context for RAG
tech_context = graph_rag_traversal("Technology")
```

## Project Structure

```
testNoSQL/
├── docker/
│   ├── docker-neo4j-compose.yml  # Docker Compose configuration
│   ├── neo4j.sh                   # Startup script
│   ├── test-neo4j.ipynb          # Jupyter notebook example
│   └── neo4j/                     # Neo4j data directories (gitignored)
├── .env                           # Environment variables (gitignored)
├── .env.example                   # Example environment file
├── .gitignore                     # Git ignore rules
└── README.md                      # This file
```

## Graph Schema

- **Company** nodes: Store ticker, name, and business summary
- **Sector** nodes: Represent industry sectors
- **IN_SECTOR** relationships: Connect companies to their sectors

## Security Notes

- Never commit `.env` file to version control
- Change the default password in `.env` before deployment
- Use strong passwords for production environments
- The `.gitignore` file is configured to exclude sensitive data

## Troubleshooting

### Neo4j Connection Issues

- Ensure Docker container is running: `docker ps`
- Check logs: `docker logs local-neo4j`
- Verify password in `.env` matches your configuration

### Data Not Appearing

- Check Neo4j browser at http://localhost:7474
- Run `MATCH (n) RETURN n LIMIT 25` to view nodes
- Ensure Yahoo Finance API is accessible

## Contributing

Feel free to open issues or submit pull requests for improvements.

## License

MIT License - feel free to use this project for learning and development.

## Acknowledgments

- [Neo4j](https://neo4j.com/) - Graph database platform
- [yfinance](https://github.com/ranaroussi/yfinance) - Yahoo Finance API wrapper
