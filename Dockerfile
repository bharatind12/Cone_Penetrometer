# Use an official Python runtime as a parent image
FROM python:3.9-slim-bullseye

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install flask

# Make port 5000 available to the world outside this container
EXPOSE 5000/tcp

LABEL version="1.0.1"
LABEL permissions='\
{\
 "ExposedPorts": {\
   "5000/tcp": {}\
  },\
  "HostConfig": {\
    "PortBindings": {\
      "5000/tcp": [\
        {\
          "HostPort": ""\
        }\
      ]\
    }\
  }\
}'


COPY start.sh .

# Make start.sh executable
RUN chmod +x start.sh

CMD ["./start.sh"]