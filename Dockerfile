FROM checkmarx/kics:v2.0.0 as kics-env
 
FROM cgr.dev/chainguard/node:latest
 
COPY --from=kics-env /app /app
 
COPY ./entrypoint.sh /entrypoint.sh
 
COPY ./ /app
 
ENTRYPOINT ["/entrypoint.sh"]
 
