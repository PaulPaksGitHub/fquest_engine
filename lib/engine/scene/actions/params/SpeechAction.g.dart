// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpeechAction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeechAction _$SpeechActionFromJson(Map<String, dynamic> json) => SpeechAction(
      characterLabel: json['characterLabel'] as String,
      text: json['text'] as String,
      dialogOptions: (json['dialogOptions'] as List<dynamic>?)
          ?.map((e) => GSDialogOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecode(_$GSActionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$SpeechActionToJson(SpeechAction instance) =>
    <String, dynamic>{
      'type': _$GSActionTypeEnumMap[instance.type],
      'characterLabel': instance.characterLabel,
      'text': instance.text,
      'dialogOptions': instance.dialogOptions?.map((e) => e.toJson()).toList(),
    };

const _$GSActionTypeEnumMap = {
  GSActionType.INIT_SCENE: 'INIT_SCENE',
  GSActionType.SPEECH: 'SPEECH',
  GSActionType.ASSIGN_VARIABLE_VALUE: 'ASSIGN_VARIABLE_VALUE',
  GSActionType.SOUND: 'SOUND',
  GSActionType.SET_BACKGROUND: 'SET_BACKGROUND',
  GSActionType.DEFINE_ANCHOR: 'DEFINE_ANCHOR',
  GSActionType.JUMP: 'JUMP',
  GSActionType.WAIT: 'WAIT',
  GSActionType.ASSIGN_CHARACTER: 'ASSIGN_CHARACTER',
  GSActionType.SHOW_CHARACTER: 'SHOW_CHARACTER',
  GSActionType.HIDE_CHARACTER: 'HIDE_CHARACTER',
};
