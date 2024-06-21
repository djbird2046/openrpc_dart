import 'content_descriptor.dart';
import 'external_documentation.dart';
import 'link.dart';
import 'server.dart';
import 'tag.dart';
import 'error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'method.g.dart';

@JsonSerializable()
class Method {
  late String name;
  List<Tag>? tags;
  String? summary;
  String? description;
  ExternalDocumentation? externalDocs;
  late List<ContentDescriptor> params;
  ContentDescriptor? result;
  bool deprecated;
  List<Server>? servers;
  List<Error>? errors;
  List<Link>? links;
  String? paramStructure;

  Method({required this.name, this.tags, this.summary, this.description, this.externalDocs, required this.params, this.deprecated = false, this.servers, this.errors, this.links, this.paramStructure});

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}