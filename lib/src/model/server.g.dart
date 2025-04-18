// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Server _$ServerFromJson(Map<String, dynamic> json) => Server(
      name: json['name'] as String,
      url: json['url'] as String,
      summary: json['summary'] as String?,
      description: json['description'] as String?,
      variables: (json['variables'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ServerVariable.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ServerToJson(Server instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'url': instance.url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('summary', instance.summary);
  writeNotNull('description', instance.description);
  writeNotNull(
      'variables', instance.variables?.map((k, e) => MapEntry(k, e.toJson())));
  return val;
}
