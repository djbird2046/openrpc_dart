// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schema _$SchemaFromJson(Map<String, dynamic> json) => Schema(
      type: json['type'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Schema.fromJson(e as Map<String, dynamic>)),
      ),
      items: json['items'] == null
          ? null
          : Schema.fromJson(json['items'] as Map<String, dynamic>),
      required: (json['required'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      default_: json['default'] as String?,
      minimum: json['minimum'] as num?,
      maximum: json['maximum'] as num?,
      minLength: json['minLength'] as num?,
      maxLength: json['maxLength'] as num?,
      pattern: json['pattern'] as String?,
      readOnly: json['readOnly'] as bool?,
      writeOnly: json['writeOnly'] as bool?,
      nullable: json['nullable'] as bool?,
      externalDocs: json['externalDocs'] == null
          ? null
          : ExternalDocumentation.fromJson(
              json['externalDocs'] as Map<String, dynamic>),
    )
      ..enum_ = json['enum'] as List<dynamic>?
      ..examples = (json['examples'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Example.fromJson(e as Map<String, dynamic>)),
      );

Map<String, dynamic> _$SchemaToJson(Schema instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('properties',
      instance.properties?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('items', instance.items?.toJson());
  writeNotNull('enum', instance.enum_);
  writeNotNull('required', instance.required);
  writeNotNull('default', instance.default_);
  writeNotNull('minimum', instance.minimum);
  writeNotNull('maximum', instance.maximum);
  writeNotNull('minLength', instance.minLength);
  writeNotNull('maxLength', instance.maxLength);
  writeNotNull('pattern', instance.pattern);
  writeNotNull(
      'examples', instance.examples?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('readOnly', instance.readOnly);
  writeNotNull('writeOnly', instance.writeOnly);
  writeNotNull('nullable', instance.nullable);
  writeNotNull('externalDocs', instance.externalDocs?.toJson());
  return val;
}
