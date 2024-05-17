import 'package:json_annotation/json_annotation.dart';

part 'server_variable.g.dart';

@JsonSerializable()
class ServerVariable{
  @JsonKey(name: 'enum')
  List<String>? enum_;

  @JsonKey(name: 'default')
  late String default_;
  String? description;

  ServerVariable({this.enum_, required this.default_, this.description});

  factory ServerVariable.fromJson(Map<String, dynamic> json) => _$ServerVariableFromJson(json);

  Map<String, dynamic> toJson() => _$ServerVariableToJson(this);
}