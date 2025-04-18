import 'package:json_annotation/json_annotation.dart';

import 'components.dart';

part 'example.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
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