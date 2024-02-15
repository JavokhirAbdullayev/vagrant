docker build -t mod-inventory .

docker run -d -t -i \
  -e JAVA_OPTIONS='-XX:MaxRAMPercentage=66.0 -Xmx256m
  -Djava.util.logging.config.file=vertx-default-jul-logging.properties' \
  -e DB_MAXPOOLSIZE='25' \
  -e DB_USERNAME='folio_admin' \
  -e LOG4J_FORMAT_MSG_NO_LOOKUPS='true' \
  -e DB_PORT='5432' \
  -e DB_HOST='10.0.2.15' \
  -e DB_DATABASE='okapi_modules' \
  -e DB_PASSWORD='folio_admin' \
  -e JAVA_DEBUG='true' \
  -e KAFKA_HOST='10.0.2.15' \
  -e ELASTICSEARCH_HOST='10.0.2.15' \
  -e KAFKA_PORT='9092' \
  -e ENV=FOLIO \
  -e MAX_REQUEST_SIZE='4000000' \
  -e DB_RECONNECTATTEMPTS='3' \
  -e DB_RECONNECTINTERVAL='1000' \
  -p 9173:9403 \
  -p 5055:5005 \
  -e DI_INVENTORY_INSTANCE_CREATED_READY_FOR_POST_PROCESSING_PARTITIONS='4' \
  -e DI_INVENTORY_INSTANCE_CREATED_PARTITIONS='5' \
  -e DI_INVENTORY_HOLDING_CREATED_PARTITIONS='7'\
  -e DI_INVENTORY_INSTANCE_MATCHED_PARTITIONS='8' \
  mod-inventory

