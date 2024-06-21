import 'components.dart';

import 'server.dart';
import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable()
class Link {
  late String name;
  String? description;
  String? summary;
  String? method;
  Map<String, dynamic>? params;
  Server? server;

  Link({required this.name, this.description, this.summary, this.method, this.params, this.server});

  factory Link.fromJson(Map<String, dynamic> json) {
    if(json["\$ref"] != null) {

      return _fromRef(json["\$ref"] as String);
    }
    return _$LinkFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LinkToJson(this);

  static Link _fromRef(String ref) {
    List<String> parts = ref.split("/");
    if(parts[0]=="#"&&parts[1]=="components"&&parts[2]=="links") {
      String refName = parts[3];
      Link? link = ComponentsSingleton.getInstance().links?[refName];
      if(link != null) {
        return link;
      } else {
        throw FormatException("\$ref not found: $ref");
      }
    } else {
      throw FormatException("\$ref format exception: $ref");
    }
  }
}