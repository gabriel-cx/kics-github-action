FROM checkmarx/kics:v2.0.0 as kics-env
 
COPY ./entrypoint.sh /entrypoint.sh
 
RUN chmod +x /entrypoint.sh
 
FROM cgr.dev/chainguard/node:latest
 
COPY --from=kics-env /app /app
 
COPY --from=kics-env /entrypoint.sh /entrypoint.sh
 
COPY ./ /app
 
ENTRYPOINT ["/entrypoint.sh"]
