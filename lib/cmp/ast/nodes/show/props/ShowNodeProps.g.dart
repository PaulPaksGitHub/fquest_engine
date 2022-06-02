// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShowNodeProps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowNodeProps _$ShowNodePropsFromJson(Map<String, dynamic> json) =>
    ShowNodeProps()
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..animation = json['animation'] == null
          ? null
          : ShowNodeAnimation.fromJson(
              json['animation'] as Map<String, dynamic>);

Map<String, dynamic> _$ShowNodePropsToJson(ShowNodeProps instance) =>
    <String, dynamic>{
      'position': instance.position?.toJson(),
      'animation': instance.animation?.toJson(),
    };
