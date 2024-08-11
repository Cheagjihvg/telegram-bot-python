FROM python:3.10

# Set working directory
WORKDIR /app

# Copy only the poetry files first for caching purposes
COPY pyproject.toml poetry.lock ./

# Install Poetry
RUN pip install poetry

# Install dependencies
RUN poetry install --no-dev

# Copy the rest of the application
COPY . .

# Set the command to run your application
CMD ["poetry", "run", "python", "main.py"]
