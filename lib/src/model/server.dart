import 'server_variable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'server.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Server{
  late String name;
  late String url;
  String? summary;
  String? description;
  Map<String, ServerVariable>? variables;

  Server({required this.name, required this.url, this.summary, this.description, this.variables});

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);

  Map<String, dynamic> toJson() => _$ServerToJson(this);
}