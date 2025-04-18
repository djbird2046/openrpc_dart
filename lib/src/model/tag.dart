import 'components.dart';
import 'external_documentation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
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