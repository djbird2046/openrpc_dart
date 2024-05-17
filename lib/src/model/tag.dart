import 'components.dart';
import 'external_documentation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'reference.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  late String name;
  String? summary;
  String? description;
  ExternalDocumentation? externalDocs;

  Tag({required this.name, this.summary, this.description, this.externalDocs});

  factory Tag.fromJson(Map<String, dynamic> json) {
    if (json["\$ref"] != null) {
      return _fromRef(json["\$ref"] as String);
    }
    return _$TagFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);

  static Tag _fromRef(String ref) {
    List<String> parts = ref.split("/");
    if(parts[0]=="#"&&parts[1]=="components"&&parts[2]=="tags") {
      String refName = parts[3];
      Tag? tag = ComponentsSingleton.getInstance().tags?[refName];
      if(tag != null) {
        return tag;
      } else {
        throw FormatException("\$ref not found: $ref");
      }
    } else {
      throw FormatException("\$ref format exception: $ref");
    }
  }
}

class TagRef {
  Tag? tag;
  Reference? ref;

  factory TagRef.fromJson(Map<String, dynamic> json){
    Tag tag;
    Reference? ref;
    String? $ref = json["\$ref"];
    if($ref != null) {
      ref = Reference.fromJson(json);
      tag = Tag._fromRef($ref);
    } else {
      tag = Tag.fromJson(json);
    }

    return TagRef(
        tag,
        ref
    );
  }

  TagRef(this.tag, this.ref) {
    if(tag == null && ref == null) {
      throw FormatException("One of parameter contentDescriptor and ref must be Non-null");
    }
  }

  Map<String, dynamic> toJson() {
    if(ref != null) {
      Map<String, dynamic> refJson = ref!.toJson();
      return refJson;
    } else {
      Map<String, dynamic> tagJson = tag!.toJson();
      return tagJson;
    }
  }

}