from fastavro.validation import validate
import json

with open('schema.avsc', 'r') as schema_file:
    schema = json.loads(schema_file.read())

message = {
    'age': 28.0,
    # 'myname': 'test',
    # 'asd': 'test2'
}

try:
    validate(message, schema)
    print('Message is matching schema')
except Exception as ex:
    print(ex)
