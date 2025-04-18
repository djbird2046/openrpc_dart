import 'package:json_annotation/json_annotation.dart';

import 'components.dart';
import 'schema.dart';

part 'content_descriptor.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ContentDescriptor {
  late String name;
  String? summary;
  String? description;
  bool required;
  late Schema schema;
  bool deprecated;

  ContentDescriptor({required this.name, this.summary, this.description, this.required = false, required this.schema, this.deprecated = false});

  factory ContentDescriptor.fromJson(Map<String, dynamic> json)  {
    if(json["\$ref"] != null) {
      return _fromRef(json["\$ref"] as String);
    }
    return _$ContentDescriptorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContentDescriptorToJson(this);

  static ContentDescriptor _fromRef(String ref) {
    List<String> parts = ref.split("/");
    if(parts[0]=="#"&&parts[1]=="components"&&parts[2]=="contentDescriptors") {
      String refName = parts[3];
      ContentDescriptor? contentDescriptor = ComponentsSingleton.getInstance().contentDescriptors?[refName];
      if(contentDescriptor != null) {
        return contentDescriptor;
      } else {
        throw FormatException("\$ref not found: $ref");
      }
    } else {
      throw FormatException("\$ref format exception: $ref");
    }
  }
}