// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerVariable _$ServerVariableFromJson(Map<String, dynamic> json) =>
    ServerVariable(
      enum_: (json['enum'] as List<dynamic>?)?.map((e) => e as String).toList(),
      default_: json['default'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ServerVariableToJson(ServerVariable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enum', instance.enum_);
  val['default'] = instance.default_;
  writeNotNull('description', instance.description);
  return val;
}
