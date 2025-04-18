// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_pairing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamplePairing _$ExamplePairingFromJson(Map<String, dynamic> json) =>
    ExamplePairing(
      name: json['name'] as String,
      description: json['description'] as String?,
      summary: json['summary'] as String?,
      params: Example.fromJson(json['params'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : Example.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamplePairingToJson(ExamplePairing instance) {
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
  val['params'] = instance.params.toJson();
  writeNotNull('result', instance.result?.toJson());
  return val;
}
