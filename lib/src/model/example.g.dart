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

Map<String, dynamic> _$ExampleToJson(Example instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('summary', instance.summary);
  writeNotNull('description', instance.description);
  writeNotNull('value', instance.value);
  writeNotNull('externalValue', instance.externalValue);
  return val;
}
