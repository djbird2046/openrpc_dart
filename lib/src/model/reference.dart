import 'package:json_annotation/json_annotation.dart';

part 'reference.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Reference {
  late String $ref;

  Reference({required this.$ref});

  factory Reference.fromJson(Map<String, dynamic> json) => _$ReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$ReferenceToJson(this);
}