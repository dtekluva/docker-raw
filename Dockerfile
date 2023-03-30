# pull official base image
FROM python:3.9-slim-bullseye
LABEL maintener="Liberty Assured Ltd"

WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install necessary packages
RUN apt-get update \
    && apt-get -y install build-essential \
    && apt-get -y install libpq-dev gcc

# install pipenv and project dependencies
RUN pip install -U pipenv
COPY Pipfile Pipfile.lock ./
RUN pipenv install --dev --system --deploy --ignore-pipfile
COPY . .