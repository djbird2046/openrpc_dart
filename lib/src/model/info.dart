import 'contact.dart';
import 'license.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  late String title;
  String? description;
  String? termsOfService;
  Contact? contact;
  License? license;
  late String version;

  Info({required this.title, this.description, this.termsOfService, this.contact, this.license, required this.version});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}