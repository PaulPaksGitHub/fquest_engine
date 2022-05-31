// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      name: json['name'] as String?,
      assetPath: json['assetPath'] as String?,
    )..props = json['props'] as Map<String, dynamic>?;

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'assetPath': instance.assetPath,
      'props': instance.props,
    };
