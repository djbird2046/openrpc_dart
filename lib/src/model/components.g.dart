// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Components _$ComponentsFromJson(Map<String, dynamic> json) => Components(
      contentDescriptors:
          (json['contentDescriptors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ContentDescriptor.fromJson(e as Map<String, dynamic>)),
      ),
      schemas: (json['schemas'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Schema.fromJson(e as Map<String, dynamic>)),
      ),
      examples: (json['examples'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Example.fromJson(e as Map<String, dynamic>)),
      ),
      links: (json['links'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Link.fromJson(e as Map<String, dynamic>)),
      ),
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Error.fromJson(e as Map<String, dynamic>)),
      ),
      examplePairing: (json['examplePairing'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ExamplePairing.fromJson(e as Map<String, dynamic>)),
      ),
      tags: (json['tags'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Tag.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ComponentsToJson(Components instance) =>
    <String, dynamic>{
      'contentDescriptors': instance.contentDescriptors,
      'schemas': instance.schemas,
      'examples': instance.examples,
      'links': instance.links,
      'errors': instance.errors,
      'examplePairing': instance.examplePairing,
      'tags': instance.tags,
    };
