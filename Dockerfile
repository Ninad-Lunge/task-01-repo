# Stage 1: Build
FROM public.ecr.aws/docker/library/python:3.9 as builder

# Set working directory
WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install them into a temp directory
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --prefix=/install -r requirements.txt

# Stage 2: Runtime
FROM public.ecr.aws/docker/library/python:3.9

# Set working directory
WORKDIR /app

# Copy installed dependencies from builder
COPY --from=builder /install /usr/local

# Copy application code
COPY app.py .

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]

# FROM public.ecr.aws/docker/library/python:3.9

# # Install known vulnerable version of a package
# RUN pip install Django==1.11.1

# COPY . /app
# WORKDIR /app
# CMD ["python", "app.py"]