// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Example _$ExampleFromJson(Map<String, dynamic> json) => Example(
      name: json['name'] as String?,
      summary: json['summary'] as String?,
      description: json['description'] as String?,
      value: json['value'],
      externalValue: json['externalValue'] as String?,
    );

Map<String, dynamic> _$ExampleToJson(Example instance) => <String, dynamic>{
      'name': instance.name,
      'summary': instance.summary,
      'description': instance.description,
      'value': instance.value,
      'externalValue': instance.externalValue,
    };
