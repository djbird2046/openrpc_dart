// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      name: json['name'] as String,
      description: json['description'] as String?,
      summary: json['summary'] as String?,
      method: json['method'] as String?,
      params: json['params'] as Map<String, dynamic>?,
      server: json['server'] == null
          ? null
          : Server.fromJson(json['server'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinkToJson(Link instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('summary', instance.summary);
  writeNotNull('method', instance.method);
  writeNotNull('params', instance.params);
  writeNotNull('server', instance.server?.toJson());
  return val;
}
