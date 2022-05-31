// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GSDialogOption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GSDialogOption _$GSDialogOptionFromJson(Map<String, dynamic> json) =>
    GSDialogOption(
      title: json['title'] as String,
      onSelectActions: (json['onSelectActions'] as List<dynamic>)
          .map((e) => GSActionModel<GSAbstractActionParams>.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GSDialogOptionToJson(GSDialogOption instance) =>
    <String, dynamic>{
      'title': instance.title,
      'onSelectActions':
          instance.onSelectActions.map((e) => e.toJson()).toList(),
    };
