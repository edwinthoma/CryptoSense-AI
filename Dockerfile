FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN curl --fail -O https://storage.googleapis.com/genai-toolbox/v0.23.0/linux/amd64/toolbox && \
    chmod +x toolbox

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY tools.yaml .
COPY start.sh .
COPY financial_agent_app/ ./financial_agent_app/

RUN chmod +x start.sh

EXPOSE 8080

CMD ["sh", "start.sh"]
