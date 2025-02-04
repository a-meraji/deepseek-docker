FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Pull the DeepSeek-R1 8B model
RUN ollama pull deepseek-r1:8b

# Expose the port that Ollama will use
EXPOSE 11434

# Start the Ollama server
CMD ["ollama", "serve"]
