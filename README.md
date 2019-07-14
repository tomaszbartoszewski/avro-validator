# JSON Message validation against AVRO

## Running validation from fastavro

Validation from fastavro gives better error messages than java code. Run validation.py to see an error message. It requires fastavro library.

```
python3 validation.py
```
```
[
  "Field(my.example.userInfo.asd) is None expected string"
]
```

## Running validation

Save in top directory avro schema (schema.avsc as an example). Save in top directory message in json format (valid.json and invalid.json as examples). Run validation script:

```
./validate.sh schema.avsc valid.json
```

If the only thing you see are library warnings, it's all correct. (I haven't figured out how to prevent them from displaying).

To see how failing validation looks like, run:

```
./validate.sh schema.avsc invalid.json
```

You should see call stack with message what is incorrect:
```
Exception in thread "main" org.apache.avro.AvroTypeException: Expected field name not found: myname
	at org.apache.avro.io.JsonDecoder.doAction(JsonDecoder.java:476)
	at org.apache.avro.io.parsing.Parser.advance(Parser.java:86)
	at org.apache.avro.io.JsonDecoder.advance(JsonDecoder.java:135)
	at org.apache.avro.io.JsonDecoder.readString(JsonDecoder.java:215)
	at org.apache.avro.io.JsonDecoder.readString(JsonDecoder.java:210)
	at org.apache.avro.io.ResolvingDecoder.readString(ResolvingDecoder.java:209)
	at org.apache.avro.generic.GenericDatumReader.readString(GenericDatumReader.java:467)
	at org.apache.avro.generic.GenericDatumReader.readString(GenericDatumReader.java:458)
	at org.apache.avro.generic.GenericDatumReader.readWithoutConversion(GenericDatumReader.java:182)
	at org.apache.avro.generic.GenericDatumReader.read(GenericDatumReader.java:151)
	at org.apache.avro.generic.GenericDatumReader.readField(GenericDatumReader.java:248)
	at org.apache.avro.generic.GenericDatumReader.readRecord(GenericDatumReader.java:237)
	at org.apache.avro.generic.GenericDatumReader.readWithoutConversion(GenericDatumReader.java:170)
	at org.apache.avro.generic.GenericDatumReader.read(GenericDatumReader.java:151)
	at org.apache.avro.generic.GenericDatumReader.read(GenericDatumReader.java:144)
	at org.apache.avro.tool.DataFileWriteTool.run(DataFileWriteTool.java:89)
	at org.apache.avro.tool.Main.run(Main.java:66)
	at org.apache.avro.tool.Main.main(Main.java:55)
```

## Combine with python

If you want to check if python code will generate valid message, copy code from test.py and add to your application to save message to a file.

## Building an image
To build new image run:
```
make build_image
```
