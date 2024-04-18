FROM checkmarx/kics:v2.0.0 as kics-env

FROM checkmarx.jfrog.io/docker/chainguard/node-yarn:20.12.2-r0--667b68092d7a93

COPY --from=kics-env /app /app

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

COPY ./ /app

ENTRYPOINT ["/entrypoint.sh"]
