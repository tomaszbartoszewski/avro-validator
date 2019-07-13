import json

messageDict = {
    "age": "29",
    "asd": "awe",
    "myname": "test"
}

with open('test.json', 'w') as json_file:
  json.dump(messageDict, json_file)