FROM checkmarx/kics:latest

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

COPY ./ /app

ENTRYPOINT ["/entrypoint.sh"]
