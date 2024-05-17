import 'components.dart';
import 'example.dart';
import 'package:json_annotation/json_annotation.dart';

import 'reference.dart';

part 'example_pairing.g.dart';

@JsonSerializable()
class ExamplePairing {
  late String name;
  String? description;
  String? summary;
  late Example params;
  Example? result;

  ExamplePairing({required this.name, this.description, this.summary, required this.params, this.result});

  factory ExamplePairing.fromJson(Map<String, dynamic> json) {
    if (json["\$ref"] != null) {
      return _fromRef(json["\$ref"] as String);
    }
    return _$ExamplePairingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExamplePairingToJson(this);

  static ExamplePairing _fromRef(String ref) {
    List<String> parts = ref.split("/");
    if(parts[0]=="#"&&parts[1]=="components"&&parts[2]=="examplePairing") {
      String refName = parts[3];
      ExamplePairing? examplePairing = ComponentsSingleton.getInstance().examplePairing?[refName];
      if(examplePairing != null) {
        return examplePairing;
      } else {
        throw FormatException("#ref not found: $ref");
      }
    } else {
      throw FormatException("#ref format exception: $ref");
    }
  }
}

class ExamplePairingRef {
  ExamplePairing? examplePairing;
  Reference? ref;

  factory ExamplePairingRef.fromJson(Map<String, dynamic> json){
    ExamplePairing examplePairing;
    Reference? ref;
    String? $ref = json["\$ref"];
    if($ref != null) {
      ref = Reference.fromJson(json);
      examplePairing = ExamplePairing._fromRef($ref);
    } else {
      examplePairing = ExamplePairing.fromJson(json);
    }

    return ExamplePairingRef(
        examplePairing,
        ref
    );
  }

  ExamplePairingRef(this.examplePairing, this.ref) {
    if(examplePairing == null && ref == null) {
      throw FormatException("One of parameter examplePairing and ref must be Non-null");
    }
  }

  Map<String, dynamic> toJson() {
    if(ref != null) {
      Map<String, dynamic> refJson = ref!.toJson();
      return refJson;
    } else {
      Map<String, dynamic> examplePairingJson = examplePairing!.toJson();
      return examplePairingJson;
    }
  }

}