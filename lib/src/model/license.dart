import 'package:json_annotation/json_annotation.dart';

part 'license.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class License {
  late String name;
  String? url;

  License({required this.name, this.url});

  factory License.fromJson(Map<String, dynamic> json) => _$LicenseFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}