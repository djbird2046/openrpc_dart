// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
      name: json['name'] as String,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['summary'] as String?,
      description: json['description'] as String?,
      externalDocs: json['externalDocs'] == null
          ? null
          : ExternalDocumentation.fromJson(
              json['externalDocs'] as Map<String, dynamic>),
      params: (json['params'] as List<dynamic>)
          .map((e) => ContentDescriptor.fromJson(e as Map<String, dynamic>))
          .toList(),
      deprecated: json['deprecated'] as bool? ?? false,
      servers: (json['servers'] as List<dynamic>?)
          ?.map((e) => Server.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      paramStructure: json['paramStructure'] as String?,
    )..result = json['result'] == null
        ? null
        : ContentDescriptor.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
      'name': instance.name,
      'tags': instance.tags,
      'summary': instance.summary,
      'description': instance.description,
      'externalDocs': instance.externalDocs,
      'params': instance.params,
      'result': instance.result,
      'deprecated': instance.deprecated,
      'servers': instance.servers,
      'errors': instance.errors,
      'links': instance.links,
      'paramStructure': instance.paramStructure,
    };
