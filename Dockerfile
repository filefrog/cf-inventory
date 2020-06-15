FROM perl:5.30

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
