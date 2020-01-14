  
FROM python:3.7

LABEL original="https://github.com/tiangolo/meinheld-gunicorn-docker"
LABEL maintainer="Connor Hornibrook <hornibrookc@rowan.edu>"
RUN pip install meinheld gunicorn

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY ./start.sh /start.sh
RUN chmod +x /start.sh
COPY ./gunicorn_conf.py /gunicorn_conf.py

ENV PYTHONPATH=/app

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/start.sh"]
