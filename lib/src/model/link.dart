import 'components.dart';
import 'reference.dart';

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

class LinkRef {
  Link? link;
  Reference? ref;

  factory LinkRef.fromJson(Map<String, dynamic> json){
    Link link;
    Reference? ref;
    String? $ref = json["\$ref"];
    if($ref != null) {
      ref = Reference.fromJson(json);
      link = Link._fromRef($ref);
    } else {
      link = Link.fromJson(json);
    }

    return LinkRef(
      link,
      ref
    );
  }

  LinkRef(this.link, this.ref) {
    if(link == null && ref == null) {
      throw FormatException("One of parameter link and ref must be Non-null");
    }
  }

  Map<String, dynamic> toJson() {
    if(ref != null) {
      Map<String, dynamic> refJson = ref!.toJson();
      return refJson;
    } else {
      Map<String, dynamic> linkJson = link!.toJson();
      return linkJson;
    }
  }

}

// class LinkRef extends Link{
//   String? $ref;
//   factory LinkRef.fromJson(Map<String, dynamic> json){
//     late Link link;
//     String? $ref = json["\$ref"];
//     if($ref != null) {
//       link = Link._fromRef($ref);
//     } else {
//       link = Link.fromJson(json);
//     }
//
//     return LinkRef(
//       name: link.name,
//       description: link.description,
//       summary: link.summary,
//       method: link.method,
//       params: link.params,
//       server: link.server,
//       $ref: $ref
//     );
//   }
//
//   LinkRef({required super.name, super.description, super.summary, super.method, super.params, super.server, this.$ref});
//
//   @override
//   Map<String, dynamic> toJson() {
//     if($ref != null) {
//       Map<String, dynamic> refJson = {};
//       refJson['\$ref'] = $ref;
//       return refJson;
//     } else {
//       Map<String, dynamic> linkJson = super.toJson();
//       return linkJson;
//     }
//   }
//
// }