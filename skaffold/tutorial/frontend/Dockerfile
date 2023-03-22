FROM nginx:1.23.3 as webserver
WORKDIR /usr/share/nginx/html

FROM webserver as runtime
COPY entrypoint.sh /docker-entrypoint.d/99-entrypoint.sh
COPY src .
EXPOSE 80
