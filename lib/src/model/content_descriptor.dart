import 'package:json_annotation/json_annotation.dart';

import 'components.dart';
import 'reference.dart';
import 'schema.dart';

part 'content_descriptor.g.dart';

@JsonSerializable()
class ContentDescriptor {
  late String name;
  String? summary;
  String? description;
  bool required;
  late SchemaRef schema;
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

class ContentDescriptorRef {
  ContentDescriptor? contentDescriptor;
  Reference? ref;

  factory ContentDescriptorRef.fromJson(Map<String, dynamic> json){
    ContentDescriptor contentDescriptor;
    Reference? ref;
    String? $ref = json["\$ref"];
    if($ref != null) {
      ref = Reference.fromJson(json);
      contentDescriptor = ContentDescriptor._fromRef($ref);
    } else {
      contentDescriptor = ContentDescriptor.fromJson(json);
    }

    return ContentDescriptorRef(
        contentDescriptor,
        ref
    );
  }

  ContentDescriptorRef(this.contentDescriptor, this.ref) {
    if(contentDescriptor == null && ref == null) {
      throw FormatException("One of parameter contentDescriptor and ref must be Non-null");
    }
  }

  Map<String, dynamic> toJson() {
    if(ref != null) {
      Map<String, dynamic> refJson = ref!.toJson();
      return refJson;
    } else {
      Map<String, dynamic> contentDescriptorJson = contentDescriptor!.toJson();
      return contentDescriptorJson;
    }
  }

}