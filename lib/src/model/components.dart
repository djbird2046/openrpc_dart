import 'content_descriptor.dart';
import 'example.dart';
import 'example_pairing.dart';
import 'link.dart';
import 'schema.dart';
import 'tag.dart';
import 'error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'components.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Components {
  Map<String, ContentDescriptor>? contentDescriptors;
  Map<String, Schema>? schemas;
  Map<String, Example>? examples;
  Map<String, Link>? links;
  Map<String, Error>? errors;
  Map<String, ExamplePairing>? examplePairing;
  Map<String, Tag>? tags;

  Components({this.contentDescriptors, this.schemas, this.examples, this.links, this.errors, this.examplePairing, this.tags});

  factory Components.fromJson(Map<String, dynamic> json) => _$ComponentsFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentsToJson(this);

}

class ComponentsSingleton {
  static Components? _components;

  static initInstance(Map<String, dynamic> componentJson) {
    _components = Components.fromJson(componentJson);
  }

  static Components getInstance() => _components!;
}

