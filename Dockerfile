FROM python:2.7-slim
MAINTAINER Amine Boujnah <amine.boujnah@esprit.tn>
RUN apt-get update && apt-get install -qq -y build-essential libpq-dev postgresql-client --fix-missing --no-install-recommends
ENV INSTALL_PATH /mobydock
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . . 

CMD gunicorn -b 0.0.0.0:8000 "mobydock.app:create_app()"
