# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Install Poetry
RUN pip install poetry

# Copy pyproject.toml and poetry.lock to the container
COPY pyproject.toml poetry.lock ./

# Install the project dependencies
RUN poetry install --no-dev --no-interaction --no-ansi

# Copy the rest of the application code
COPY . .

# Expose port (if your app runs on a specific port)
EXPOSE 8000

# Run the application
CMD ["poetry", "run", "python", "main.py"]
