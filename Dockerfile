# Dockerfile
FROM python:3.11-slim

WORKDIR /app
COPY soil_analysis.py .

CMD ["python", "soil_analysis.py"]
