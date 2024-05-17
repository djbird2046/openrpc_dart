import 'package:json_annotation/json_annotation.dart';

import 'components.dart';
import 'reference.dart';

part 'example.g.dart';

@JsonSerializable()
class Example {
  String? name;
  String? summary;
  String? description;
  dynamic value;
  String? externalValue;

  Example({this.name, this.summary, this.description, this.value, this.externalValue});

  factory Example.fromJson(Map<String, dynamic> json) {
    if(json["\$ref"] != null) {
      return _fromRef(json["\$ref"] as String);
    }
    return _$ExampleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExampleToJson(this);

  static Example _fromRef(String ref) {
    List<String> parts = ref.split("/");
    if(parts[0]=="#"&&parts[1]=="components"&&parts[2]=="examples") {
      String refName = parts[3];
      Example? example = ComponentsSingleton.getInstance().examples?[refName];
      if(example != null) {
        return example;
      } else {
        throw FormatException("#ref not found: $ref");
      }
    } else {
      throw FormatException("#ref format exception: $ref");
    }
  }
}

class ExampleRef {
  Example? example;
  Reference? ref;

  factory ExampleRef.fromJson(Map<String, dynamic> json){
    Example example;
    Reference? ref;
    String? $ref = json["\$ref"];
    if($ref != null) {
      ref = Reference.fromJson(json);
      example = Example._fromRef($ref);
    } else {
      example = Example.fromJson(json);
    }

    return ExampleRef(
        example,
        ref
    );
  }

  ExampleRef(this.example, this.ref) {
    if(example == null && ref == null) {
      throw FormatException("One of parameter example and ref must be Non-null");
    }
  }

  Map<String, dynamic> toJson() {
    if(ref != null) {
      Map<String, dynamic> refJson = ref!.toJson();
      return refJson;
    } else {
      Map<String, dynamic> exampleJson = example!.toJson();
      return exampleJson;
    }
  }

}