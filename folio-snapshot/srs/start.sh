docker build -t mod-srs .

docker run -d -t -i \
  -e JAVA_OPTIONS='-Xmx512m -Dcom.sun.management.jmxremote.ssl=false -Xlog:gc*,gc+phases=debug:file=/tmp/srs_gc.log:time,pid,tags:filecount=10,filesize=20m -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=9994 -Dcom.sun.management.jmxremote.rmi.port=9994 -Djava.rmi.server.hostname=localhost -Dcom.sun.management.jmxremote.local.only=false -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp' \
  -e DB_MAXPOOLSIZE='25' \
  -e DB_USERNAME='folio_admin' \
  -e DB_PORT='5432' \
  -e DB_HOST='10.0.2.15' \
  -e DB_DATABASE='okapi_modules' \
  -e DB_PASSWORD='folio_admin' \
  -e JAVA_DEBUG='true' \
  -e KAFKA_HOST='10.0.2.15' \
  -e KAFKA_PORT='9092' \
  -p 9148:8081 \
  -p 5005:5005 \
  -e MAX_REQUEST_SIZE='4000000' \
  -e ENV=FOLIO \
  -e DI_SRS_MARC_BIB_RECORD_MATCHED_PARTITIONS='10' \
  -e DI_SRS_MARC_BIB_INSTANCE_HRID_SET_PARTITIONS='5' \
  mod-srs
