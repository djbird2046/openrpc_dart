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

Map<String, dynamic> _$MethodToJson(Method instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', instance.tags?.map((e) => e.toJson()).toList());
  writeNotNull('summary', instance.summary);
  writeNotNull('description', instance.description);
  writeNotNull('externalDocs', instance.externalDocs?.toJson());
  val['params'] = instance.params.map((e) => e.toJson()).toList();
  writeNotNull('result', instance.result?.toJson());
  val['deprecated'] = instance.deprecated;
  writeNotNull('servers', instance.servers?.map((e) => e.toJson()).toList());
  writeNotNull('errors', instance.errors?.map((e) => e.toJson()).toList());
  writeNotNull('links', instance.links?.map((e) => e.toJson()).toList());
  writeNotNull('paramStructure', instance.paramStructure);
  return val;
}
