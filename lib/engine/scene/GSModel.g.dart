// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GSModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GSModel _$GSModelFromJson(Map<String, dynamic> json) => GSModel(
      label: json['label'] as String,
      actions: (json['actions'] as List<dynamic>)
          .map((e) => GSActionModel<GSAbstractActionParams>.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GSModelToJson(GSModel instance) => <String, dynamic>{
      'label': instance.label,
      'actions': instance.actions.map((e) => e.toJson()).toList(),
    };
