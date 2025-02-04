# Use a base image with Ollama installed
FROM ollama/ollama:latest

# Set working directory
WORKDIR /app

# Ensure Ollama starts before pulling the model
RUN ollama serve & \
    sleep 5 && \
    ollama pull deepseek-r1:8b

# Expose the port Ollama uses
EXPOSE 11434

# Start Ollama when the container runs
CMD ["ollama", "serve"]
