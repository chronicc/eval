FROM bash
RUN apk add lighttpd
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*
ENTRYPOINT ["entrypoint.sh"]
