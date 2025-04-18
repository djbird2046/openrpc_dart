import 'components.dart';
import 'external_documentation.dart';
import 'info.dart';
import 'method.dart';
import 'server.dart';
import 'package:json_annotation/json_annotation.dart';

part 'open_rpc.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class OpenRPC {
  late String openrpc;
  late Info info;
  List<Server>? servers;
  late List<Method> methods;
  Components? components;
  ExternalDocumentation? externalDocs;

  OpenRPC({required this.openrpc, required this.info, this.servers, required this.methods, this.components, this.externalDocs});

  factory OpenRPC.fromJson(Map<String, dynamic> json) => _$OpenRPCFromJson(json);

  Map<String, dynamic> toJson() => _$OpenRPCToJson(this);
}