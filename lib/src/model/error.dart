import 'package:json_annotation/json_annotation.dart';

import 'components.dart';
import 'reference.dart';

part 'error.g.dart';

@JsonSerializable()
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

class ErrorRef {
  Error? error;
  Reference? ref;

  factory ErrorRef.fromJson(Map<String, dynamic> json){
    Error error;
    Reference? ref;
    String? $ref = json["\$ref"];
    if($ref != null) {
      ref = Reference.fromJson(json);
      error = Error._fromRef($ref);
    } else {
      error = Error.fromJson(json);
    }

    return ErrorRef(
        error,
        ref
    );
  }

  ErrorRef(this.error, this.ref) {
    if(error == null && ref == null) {
      throw FormatException("One of parameter error and ref must be Non-null");
    }
  }

  Map<String, dynamic> toJson() {
    if(ref != null) {
      Map<String, dynamic> refJson = ref!.toJson();
      return refJson;
    } else {
      Map<String, dynamic> errorJson = error!.toJson();
      return errorJson;
    }
  }

}