// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_descriptor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentDescriptor _$ContentDescriptorFromJson(Map<String, dynamic> json) =>
    ContentDescriptor(
      name: json['name'] as String,
      summary: json['summary'] as String?,
      description: json['description'] as String?,
      required: json['required'] as bool? ?? false,
      schema: SchemaRef.fromJson(json['schema'] as Map<String, dynamic>),
      deprecated: json['deprecated'] as bool? ?? false,
    );

Map<String, dynamic> _$ContentDescriptorToJson(ContentDescriptor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'summary': instance.summary,
      'description': instance.description,
      'required': instance.required,
      'schema': instance.schema,
      'deprecated': instance.deprecated,
    };
