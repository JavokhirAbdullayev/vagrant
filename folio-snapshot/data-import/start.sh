docker build -t data-import .

docker run -d -t -i \
  -e JAVA_OPTIONS='-Xmx512m -Dcom.sun.management.jmxremote.ssl=false
  -Xlog:gc*,gc+phases=debug:file=/tmp/srs_gc.log:time,pid,tags:filecount=10,filesize=20m
  -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=9994
  -Dcom.sun.management.jmxremote.rmi.port=9994 -Djava.rmi.server.hostname=localhost
  -Dcom.sun.management.jmxremote.local.only=false -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp' \
  -e DB_MAXPOOLSIZE='25' \
  -e DB_USERNAME='folio_admin' \
  -e DB_PORT='5433' \
  -e DB_HOST='192.168.0.104' \
  -e DB_DATABASE='okapi_modules' \
  -e DB_PASSWORD='folio_admin' \
  -e JAVA_DEBUG='true' \
  -e KAFKA_HOST='192.168.0.104' \
  -e KAFKA_PORT='9092' \
  -p 9137:8081 \
  -p 9994:5005 \
  -e MAX_REQUEST_SIZE='4000000' \
  -e ENV=FOLIO \
  -e DI_INITIALIZATION_STARTED_PARTITIONS='20' \
  -e DI_RAW_RECORDS_CHUNK_READ_PARTITIONS='10' \
  data-import
