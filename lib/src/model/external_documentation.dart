import 'package:json_annotation/json_annotation.dart';

part 'external_documentation.g.dart';

@JsonSerializable()
class ExternalDocumentation {
  String? description;
  late String url;

  ExternalDocumentation({this.description, required this.url});

  factory ExternalDocumentation.fromJson(Map<String, dynamic> json) => _$ExternalDocumentationFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalDocumentationToJson(this);
}