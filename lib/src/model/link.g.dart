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

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'summary': instance.summary,
      'method': instance.method,
      'params': instance.params,
      'server': instance.server,
    };
