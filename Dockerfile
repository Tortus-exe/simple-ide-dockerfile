# ==========================================
# Stage 1: Build the VB.NET Application
# ==========================================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app

# Clone the repository
# (Alternatively, you can omit this line and run 'docker build .' directly inside a cloned repo)
RUN apt-get update && apt-get install -y git && \
    git clone https://github.com/jamesplotts/simpleide.git .

# Restore dependencies and publish a self-contained release
RUN dotnet restore
RUN dotnet publish -c Release -o out

# ==========================================
# Stage 2: Create the Lightweight Runtime
# ==========================================
FROM mcr.microsoft.com/dotnet/runtime:8.0 AS runtime
WORKDIR /app

# Install GTK+ 3 and dependencies required for the GTK# 3 UI wrapper
RUN apt-get update && apt-get install -y \
    libgtk-3-0 \
    libglib2.0-0 \
    libc6 \
    && rm -rf /var/lib/apt/lists/*

# Copy the build artifacts from the build stage
COPY --from=build-env /app/out .

# Define the entry point for the executable
ENTRYPOINT ["./SimpleIDE"]