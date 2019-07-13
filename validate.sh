SCHEMA_FILE_NAME=${1:?}
MESSAGE_FILE_NAME=${2:?}

docker run --env SCHEMA=/to-validate/$SCHEMA_FILE_NAME --env MESSAGE=/to-validate/$MESSAGE_FILE_NAME --mount type=bind,src=$(pwd)/to-validate/,dst=/to-validate avro-validator