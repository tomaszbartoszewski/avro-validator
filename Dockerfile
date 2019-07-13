FROM openjdk:latest

ADD http://www.us.apache.org/dist/avro/avro-1.9.0/java/avro-tools-1.9.0.jar .

ENTRYPOINT java -jar ./avro-tools-1.9.0.jar fromjson --schema-file $SCHEMA $MESSAGE > message.avro