# Base image
FROM python:3.10-slim

# Install Poppler (for pdf2image)
RUN apt-get update && apt-get install -y poppler-utils

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (optional, for local testing)
EXPOSE 5000

# Run your app
CMD ["streamlit", "run", "app.py", "--server.port=5000", "--server.address=0.0.0.0"]

