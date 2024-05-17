import 'reference.dart';

class Schema {
  Map<String, dynamic> schema;

  Schema({required this.schema});

  factory Schema.fromJson(Map<String, dynamic> json) {
    return Schema(schema: json);
  }

  Map<String, dynamic> toJson() => schema;

  static Schema _fromRef(String ref) {
    List<String> parts = ref.split("/");
    if(parts[0]=="#"&&parts[1]=="components"&&parts[2]=="schemas") {
      String refName = parts[3];
      Schema? schema = SchemasSingleton.getInstance()[refName];
      if(schema != null) {
        return schema;
      } else {
        throw FormatException("\$ref not found: $ref");
      }
    } else {
      throw FormatException("\$ref format exception: $ref");
    }
  }
}

class SchemaRef {
  Schema? schema;
  Reference? ref;

  factory SchemaRef.fromJson(Map<String, dynamic> json){
    Schema schema;
    Reference? ref;
    String? $ref = json["\$ref"];
    if($ref != null) {
      ref = Reference.fromJson(json);
      schema = Schema._fromRef($ref);
    } else {
      schema = Schema.fromJson(json);
    }

    return SchemaRef(
        schema,
        ref
    );
  }

  SchemaRef(this.schema, this.ref) {
    if(schema == null && ref == null) {
      throw FormatException("One of parameter schema and ref must be Non-null");
    }
  }

  Map<String, dynamic> toJson() {
    if(ref != null) {
      Map<String, dynamic> refJson = ref!.toJson();
      return refJson;
    } else {
      Map<String, dynamic> schemaJson = schema!.toJson();
      return schemaJson;
    }
  }

}


class SchemasSingleton {
  static Map<String, Schema>? _schemas;

  static initInstance(Map<String, dynamic> schemasJson) {
    Map<String, Schema> schemas = {};
    schemasJson.forEach((key, value) {
      schemas[key] = Schema.fromJson(value);
    });
    _schemas = schemas;
  }

  static Map<String, Schema> getInstance() => _schemas!;
}

