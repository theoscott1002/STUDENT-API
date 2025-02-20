# ---- Stage 1: Build ----
    FROM python:3.11-slim AS builder

    # Set working directory
    WORKDIR /app
    
    # Install dependencies
    COPY requirements.txt .
    RUN pip install --no-cache-dir --upgrade pip \
        && pip install --no-cache-dir -r requirements.txt
    
    # ---- Stage 2: Run ----
    FROM python:3.11-slim
    
    # Set environment variables
    ENV FLASK_APP=run.py
    ENV FLASK_ENV=production
    
    # Set working directory
    WORKDIR /app
    
    # Copy installed dependencies from builder stage
    COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
    COPY --from=builder /usr/local/bin /usr/local/bin
    
    # Copy application files
    COPY . .
    
    # Expose port
    EXPOSE 4000
    
    # Run the application
    CMD ["flask", "run", "--host=0.0.0.0", "--port=4000"]
    