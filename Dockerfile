# Use an official Python runtime as the base image
FROM python:3.7

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port on which the API will run
EXPOSE 8000

# Set the entrypoint command for the container
CMD ["python", "app.py"]

