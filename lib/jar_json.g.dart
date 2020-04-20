// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jar_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

jar_json _$jar_jsonFromJson(Map<String, dynamic> json) {
  return jar_json(
    json['name'] as String,
    (json['paper'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$jar_jsonToJson(jar_json instance) => <String, dynamic>{
      'name': instance.name,
      'paper': instance.paper,
    };
