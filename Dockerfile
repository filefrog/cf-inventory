FROM perl:5.30

LABEL maintainer="James Hunt <images@huntprod.com>" \
      summary="Cloud Foundry Inventory" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/filefrog/cf-inventory.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0"

RUN cpanm \
 LWP::Protocol::https \
 LWP::UserAgent \
 JSON \
 YAML

ADD bin/inventory /usr/local/bin

ENV DEBUG    0
ENV NAP_TIME 0.1
ENV PERL_LWP_SSL_VERIFY_HOSTNAME 0

VOLUME /data

WORKDIR /data
CMD ["inventory"]
