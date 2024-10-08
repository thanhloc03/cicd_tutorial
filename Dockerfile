FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"

# Install necessary packages
RUN apt update -y && apt install -y python3-pip python3-dev build-essential python3-venv

# Create a working directory
WORKDIR /flask_app

# Copy the application code
ADD . /flask_app

# Create a virtual environment and ensure pip is installed
RUN python3 -m venv venv && \
    venv/bin/python -m pip install --upgrade pip

# Install requirements
RUN venv/bin/pip install -r requirements.txt

# Set the entry point to use the virtual environment's Python
ENTRYPOINT ["./venv/bin/python"]
CMD ["flask_docker.py"]
