// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HideNodeProps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HideNodeProps _$HideNodePropsFromJson(Map<String, dynamic> json) =>
    HideNodeProps()
      ..animation = json['animation'] == null
          ? null
          : HideNodeAnimation.fromJson(
              json['animation'] as Map<String, dynamic>);

Map<String, dynamic> _$HideNodePropsToJson(HideNodeProps instance) =>
    <String, dynamic>{
      'animation': instance.animation?.toJson(),
    };
