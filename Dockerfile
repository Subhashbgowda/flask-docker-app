# Step 1: Use an official Python image from Docker Hub
FROM python:3.9-slim

# Step 2: Set the working directory inside the container to /app
WORKDIR /app

# Step 3: Copy the requirements.txt file from your local system into the container
COPY requirements.txt requirements.txt

# Step 4: Install dependencies from requirements.txt inside the container
RUN pip install -r requirements.txt

# Step 5: Copy the rest of the app’s files into the container
COPY . .

# Step 6: Expose port 80 for the application to listen on
EXPOSE 80

# Step 7: Define the command to run the application using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:80", "app:app"]

