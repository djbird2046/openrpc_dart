import 'example.dart';
import 'external_documentation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schema.g.dart';

@JsonSerializable()

class Schema {
  String type;
  String? title;
  String? description;
  Map<String, Schema>? properties;
  Schema? items;
  @JsonKey(name: "enum")
  List<String>? enum_;
  List<String>? required;

  @JsonKey(name: "default")
  String? default_;

  num? minimum;
  num? maximum;
  num? minLength;
  num? maxLength;
  String? pattern;

  Map<String, Example>? examples;
  bool? readOnly;
  bool? writeOnly;
  bool? nullable;

  ExternalDocumentation? externalDocs;

  Schema({required this.type, this.title, this.description, this.properties, this.items, this.required,
    this.default_, this.minimum, this.maximum, this.minLength, this.maxLength, this.pattern,
    this.readOnly, this.writeOnly, this.nullable,
    this.externalDocs});

  factory Schema.fromJson(Map<String, dynamic> json) {
    if(json["\$ref"] != null) {
      return _fromRef(json["\$ref"] as String);
    }
    return _$SchemaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SchemaToJson(this);

  static Schema _fromRef(String ref) {
    List<String> parts = ref.split("/");
    if(parts[0]=="#"&&parts[1]=="components"&&parts[2]=="schemas") {
      String refName = parts[3];
      Schema? schema = SchemasSingleton.getInstance()[refName];
      if(schema != null) {
        return schema;
      } else {
        throw FormatException("#ref not found: $ref");
      }
    } else {
      throw FormatException("#ref format exception: $ref");
    }
  }

}

class SchemasSingleton {
  static Map<String, Schema> _schemas = {};

  static initInstance(Map<String, dynamic> schemasJson) {
    schemasJson.forEach((key,value) {
      String schemaName = key;
      Map<String, dynamic> schemaMap = value as Map<String, dynamic>;
      if(schemaMap["\$ref"] == null) {
        _schemas[schemaName] = Schema.fromJson(schemaMap);
      }
    });
  }

  static Map<String, Schema> getInstance() => _schemas;
}