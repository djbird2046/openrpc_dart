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
      schema: Schema.fromJson(json['schema'] as Map<String, dynamic>),
      deprecated: json['deprecated'] as bool? ?? false,
    );

Map<String, dynamic> _$ContentDescriptorToJson(ContentDescriptor instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('summary', instance.summary);
  writeNotNull('description', instance.description);
  val['required'] = instance.required;
  val['schema'] = instance.schema.toJson();
  val['deprecated'] = instance.deprecated;
  return val;
}
