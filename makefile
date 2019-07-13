build_image:
	docker build . -t avro-validator

run_example:
	./validate.sh schema.avsc valid.json