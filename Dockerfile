# Use Python 3.10 image
FROM python:3.10-slim

# Install system dependencies (you can add more as needed)
RUN apt-get update && apt-get install -y \
    build-essential \
    libjpeg-dev \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to ensure the latest version is installed
RUN pip install --upgrade pip

# Set the working directory
WORKDIR /code

# Copy requirements.txt into the container
COPY requirements.txt .

# Install Python dependencies
#RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose the port (if needed)
EXPOSE 8000

# Run Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
