# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install additional packages
RUN apt-get update && apt-get install -y \
    curl \
    gettext \
    libpq-dev

# Set work directory
WORKDIR /app

# Copy files
COPY requirements.txt /app/
COPY . /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8000

# Run command
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
