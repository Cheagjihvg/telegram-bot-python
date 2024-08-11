# Dockerfile

FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create and set working directory
WORKDIR /app

# Install dependencies
COPY pyproject.toml poetry.lock /app/
RUN pip install --upgrade pip
RUN pip install poetry
RUN poetry install --no-dev

# Copy the rest of the application
COPY . /app/

# Run the application
CMD ["poetry", "run", "python", "main.py"]
