#!/bin/sh
set -eu

PORT_VALUE="\${PORT:-8080}"

# Vercel supplies PORT at runtime. Keep Tomcat's HTTP connector aligned with it.
sed -i "s#port=\"8080\"#port=\"\${PORT_VALUE}\"#" \
  /usr/local/tomcat/conf/server.xml

exec /usr/local/tomcat/bin/catalina.sh run
