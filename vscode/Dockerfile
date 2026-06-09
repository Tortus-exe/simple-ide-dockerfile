FROM ubuntu:latest

# Install prerequisites
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo \
    build-essential

# Install Code-Server (VS Code in the browser)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Expose port for Code-Server
EXPOSE 8080

# Start Code-Server on container launch
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]