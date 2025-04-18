// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_rpc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenRPC _$OpenRPCFromJson(Map<String, dynamic> json) => OpenRPC(
      openrpc: json['openrpc'] as String,
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      servers: (json['servers'] as List<dynamic>?)
          ?.map((e) => Server.fromJson(e as Map<String, dynamic>))
          .toList(),
      methods: (json['methods'] as List<dynamic>)
          .map((e) => Method.fromJson(e as Map<String, dynamic>))
          .toList(),
      components: json['components'] == null
          ? null
          : Components.fromJson(json['components'] as Map<String, dynamic>),
      externalDocs: json['externalDocs'] == null
          ? null
          : ExternalDocumentation.fromJson(
              json['externalDocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenRPCToJson(OpenRPC instance) {
  final val = <String, dynamic>{
    'openrpc': instance.openrpc,
    'info': instance.info.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('servers', instance.servers?.map((e) => e.toJson()).toList());
  val['methods'] = instance.methods.map((e) => e.toJson()).toList();
  writeNotNull('components', instance.components?.toJson());
  writeNotNull('externalDocs', instance.externalDocs?.toJson());
  return val;
}
