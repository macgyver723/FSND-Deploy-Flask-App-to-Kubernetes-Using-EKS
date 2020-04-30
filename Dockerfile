# Use the official image as a parent image.
FROM python:stretch

# Set the working directory
WORKDIR /app

# copy files in this directory into the working directory
COPY . /app

# install depedencies
RUN pip install --upgrade pip
RUN pip install flask
RUN pip install pyjwt
RUN pip install gunicorn
RUN pip install pytest

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 8080

# Run specified commands
ENTRYPOINT [ "gunicorn", "-b", ":8080", "main:APP" ]
