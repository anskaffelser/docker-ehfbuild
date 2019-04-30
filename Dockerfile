FROM klakegg/saxon:9.9.1.2-base AS saxon

FROM klakegg/schematron:dev-base AS schematron


FROM scratch AS prepare

COPY --from=saxon / /
COPY --from=schematron /iso-schematron /
COPY --from=schematron /klakegg /


FROM openjdk:8u201-jre-alpine3.9

COPY --from=prepare / /

RUN apk add --no-cache gettext git zip unzip asciidoctor \
 && ln -s /bin/iso-schematron /bin/schematron

VOLUME /src /target

WORKDIR /src

CMD ["sh"]
