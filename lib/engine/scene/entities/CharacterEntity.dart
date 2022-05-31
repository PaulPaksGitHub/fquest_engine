import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fquest_engine/cmp/ast/nodes/base/BaseNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/character/CharacterNode.dart';
import 'package:fquest_engine/engine/ast/interpreter/models/EvalResult.dart';
import 'package:fquest_engine/engine/character/Position.dart';

import '../../character/Character.dart';

class CharacterEntity {
  late CharacterNode characterNode;
  late Character character;
  late Size size;
  Position position = Position(left: 0, bottom: 0);

  static Future<CharacterEntity> fromNode(CharacterNode characterNode, Future<EvalResult> Function(BaseNode node) eval) async {
    CharacterEntity entity = CharacterEntity();
    entity.characterNode = characterNode;
    entity.character = await Character.fromNode(characterNode, eval);

    if (characterNode.assetPath != null) {
      final imageResource = await rootBundle.load((await eval(characterNode.assetPath!)).value as String);
      final imageUintBytes = imageResource.buffer
          .asUint8List(imageResource.offsetInBytes, imageResource.lengthInBytes);
      final decodedImage = await decodeImageFromList(imageUintBytes);

      entity.size =
          Size(decodedImage.width.toDouble(), decodedImage.height.toDouble());
    }

    return entity;
  }
}
