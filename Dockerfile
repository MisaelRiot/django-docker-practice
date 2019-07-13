# Image running on alpine linux to avoid unnecessary files
FROM python:3.7.4-alpine3.10

LABEL maintainer="Misael Mondragon Lenis"

# Tells python to run in unbuffered mode 
# it doesn't allow python to buffer output so it prints them directly
ENV PYTHONUNBUFFERED 1

#Dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Create app folder in the docker image?
RUN mkdir /app
# any application will be running from the app folder as the default directory
WORKDIR /app
#copies the contents of the app folder where we created the project
# to the app folder where we created our image
COPY ./app /app

RUN adduser -D misael
USER misael