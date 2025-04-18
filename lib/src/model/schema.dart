import 'example.dart';
import 'external_documentation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schema.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Schema {
  String type;
  String? title;
  String? description;
  Map<String, Schema>? properties;
  Schema? items;
  @JsonKey(name: "enum")
  List<Object?>? enum_;
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
      Schema schema =  _fromRef(json["\$ref"] as String);
      schema._validateEnumConsistency();
      return schema;
    }
    Schema schema =  _$SchemaFromJson(json);
    schema._validateEnumConsistency();
    return schema;
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

  void _validateEnumConsistency() {
    if (enum_ == null || enum_!.isEmpty) {
      return;
    }
    for (var i = 0; i < enum_!.length; i++) {
      var value = enum_![i];
      if (!_isValueConsistentWithType(value)) {
        throw FormatException('Enum value at index $i ("$value") does not match schema type "$type".');
      }
    }
  }

  bool _isValueConsistentWithType(Object? value) {
    switch (type) {
      case 'string':
        return value is String || value == null;
      case 'integer':
        return value is int || value == null;
      case 'number':
        return (value is num && value is! bool) || value == null;
      case 'boolean':
        return value is bool || value == null;
      case 'null':
        return value == null;
      default:
        return true;
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