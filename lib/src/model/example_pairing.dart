import 'components.dart';
import 'example.dart';
import 'package:json_annotation/json_annotation.dart';

part 'example_pairing.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
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
