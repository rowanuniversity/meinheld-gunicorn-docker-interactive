  
FROM python:3.7
LABEL original="https://github.com/tiangolo"
LABEL maintainer="Connor Hornibrook <hornibrookc@rowan.edu>"
RUN pip install meinheld gunicorn

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

ENV PYTHONPATH=/app
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
# Run the start script, it will check for an /app/prestart.sh script (e.g. for migrations)
# And then will start Gunicorn with Meinheld
CMD ["/start.sh"]
HEALTHCHECK --interval=2m --timeout=3s CMD curl -f http://127.0.0.1/ || exit 1