FROM python:3.6-alpine

ENV FLASK_APP yowla.py
ENV FLASK_CONFIG production

#RUN adduser -D yowla
#USER yowla

WORKDIR /home/yowla

COPY requirements requirements
RUN python -m venv venv
RUN venv/bin/pip install -r requirements/docker.txt


#RUN sudo chmod 777 data.sqlite
COPY app app
COPY migrations migrations
COPY yowla.py config.py boot.sh ./
COPY data/data.sqlite data.sqlite

# run-time configuration
EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
