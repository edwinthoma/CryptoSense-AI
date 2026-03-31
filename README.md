# CryptoSense AI

> An intelligent crypto & macro financial decision agent powered by Google ADK, Gemini 2.5 Flash, and MCP Toolbox for Databases.

## About

CryptoSense AI connects to live Bitcoin, Ethereum, and World Bank economic datasets via MCP Toolbox for Databases, analyzes real blockchain transaction data alongside global macro indicators, and delivers structured, data-backed investment recommendations — so you spend less time interpreting data and more time making decisions.

## Live Demo

[https://financial-agent-982747014163.us-central1.run.app](https://financial-agent-982747014163.us-central1.run.app)

## Architecture

- **Agent Framework:** Google Agent Development Kit (ADK)
- **LLM:** Gemini 2.5 Flash
- **MCP Server:** MCP Toolbox for Databases
- **Data Sources:** BigQuery public datasets
  - `bigquery-public-data.crypto_bitcoin.transactions`
  - `bigquery-public-data.crypto_ethereum.transactions`
  - `bigquery-public-data.world_bank_wdi.indicators_data`
- **Deployment:** Google Cloud Run

## Features

- Real-time Bitcoin network activity analysis (30 days)
- Real-time Ethereum network activity analysis (30 days)
- Global macro economic indicators (GDP, inflation, interest rates)
- Multi-tool orchestration based on user intent
- Structured responses: Summary → Key Insights → Recommendation
- Hallucination-free — only uses data retrieved via MCP tools

## Sample Queries

- "Should I invest in Bitcoin right now?"
- "Compare Bitcoin vs Ethereum activity this month"
- "What does the global economy say about crypto investment?"
- "Analyze Ethereum network health"

## Project Structure
```
cryptosense-ai/
├── Dockerfile
├── start.sh
├── tools.yaml
├── requirements.txt
└── financial_agent_app/
    ├── __init__.py
    └── agent.py
```

## Setup

### Prerequisites
- Google Cloud project with billing enabled
- Google AI Studio API key
- `gcloud` CLI authenticated

### Local Development
```bash
# Install dependencies
python3 -m venv .venv
source .venv/bin/activate
pip install google-adk==1.28.0 toolbox-core

# Start MCP Toolbox (Terminal 1)
./toolbox --tools-file="tools.yaml"

# Start ADK web server (Terminal 2)
adk web
```

### Deploy to Cloud Run
```bash
export PROJECT_ID=your-project-id
export SERVICE_NAME=cryptosense-ai

gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME

gcloud run deploy $SERVICE_NAME \
  --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
  --region us-central1 \
  --platform managed \
  --allow-unauthenticated \
  --memory 1Gi \
  --timeout 300 \
  --set-secrets="GOOGLE_API_KEY=GOOGLE_API_KEY:latest"
```

## Built With

Google ADK · Gemini 2.5 Flash · MCP Toolbox for Databases · BigQuery · Cloud Run · Docker · Python 3.11

## Author
Edwin Thomas
