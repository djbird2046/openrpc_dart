import 'package:json_annotation/json_annotation.dart';

import 'components.dart';

part 'error.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Error {
  late int code;
  late String message;
  dynamic data;

  Error({required this.code, required this.message, this.data});

  factory Error.fromJson(Map<String, dynamic> json) {
    if (json["\$ref"] != null) {
      return _fromRef(json["\$ref"] as String);
    }
    return _$ErrorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  static Error _fromRef(String ref) {
    List<String> parts = ref.split("/");
    if(parts[0]=="#"&&parts[1]=="components"&&parts[2]=="errors") {
      String refName = parts[3];
      Error? error = ComponentsSingleton.getInstance().errors?[refName];
      if(error != null) {
        return error;
      } else {
        throw FormatException("\$ref not found: $ref");
      }
    } else {
      throw FormatException("\$ref format exception: $ref");
    }
  }
}