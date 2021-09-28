#!/usr/bin/env bash

HTTP_CONFIG_PATH=${HTTP_CONFIG_PATH:=/etc/lighttpd/lighttpd.conf}
HTTP_DATA_DIR=${HTTP_DATA_DIR:=/srv/www}
HTTP_LOG_PATH=/dev/fd/3
HTTP_WRITE_INDEX=True

cat << EOF > $HTTP_CONFIG_PATH
server.modules = (
  "mod_access",
  "mod_accesslog"
)
mimetype.assign             = (
  ".html" => "text/html",
  ".json" => "application/json",
)
server.username      = "lighttpd"
server.groupname     = "lighttpd"
server.document-root = "${HTTP_DATA_DIR}"
server.pid-file      = "/run/lighttpd.pid"
server.errorlog      = "${HTTP_LOG_PATH}"
server.indexfiles    = ("index.html", "index.json")
accesslog.filename   = "${HTTP_LOG_PATH}"
EOF

mkdir -p $HTTP_DATA_DIR
chown lighttpd:lighttpd $HTTP_DATA_DIR
if [ $HTTP_WRITE_INDEX ]
then
cat << EOF > $HTTP_DATA_DIR/index.json
{
  "state": "running",
  "version": "$(lighttpd -v | awk '{ print $1 }')"
}
EOF
fi

exec 3>&1
chown lighttpd:lighttpd $HTTP_LOG_PATH
lighttpd -Df $HTTP_CONFIG_PATH

