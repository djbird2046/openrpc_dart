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

  Example? example;
  Map<String, Example>? examples;
  bool? readOnly;
  bool? writeOnly;
  bool? nullable;

  ExternalDocumentation? externalDocs;

  Schema({required this.type, this.title, this.description, this.properties, this.items, this.required,
    this.default_, this.minimum, this.maximum, this.minLength, this.maxLength, this.pattern,
    this.example, this.examples, this.readOnly, this.writeOnly, this.nullable,
    this.externalDocs});

  factory Schema.fromJson(Map<String, dynamic> json) => _$SchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaToJson(this);

}

class SchemasSingleton {
  static Map<String, Schema>? _schemas;
  static var cache = <String, dynamic>{};

  static initInstance(Map<String, dynamic> schemasJson) {
    Map<String, Schema> schemas = {};
    Map<String, String> refMap = {};
    schemasJson.forEach((key, value) {
      if(value["\$ref"] != null) {
        refMap[key] = value as String;
      } else {
        schemas[key] = Schema.fromJson(value);
      }
    });

    refMap.forEach((key, value) {
      List<String> parts = value.split("/");
      if(parts[0]=="#"&&parts[1]=="components"&&parts[2]=="schemas") {
        String refName = parts[3];
        if(schemas[refName] != null) {
          schemas[key] = schemas[refName]!;
        }
      }
    });

    _schemas = schemas;
  }

  static Map<String, Schema> getInstance() => _schemas!;
}