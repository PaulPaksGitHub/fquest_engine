import 'package:fquest_engine/cmp/ast/nodes/base/BaseNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/character/CharacterNode.dart';
import 'package:fquest_engine/engine/ast/interpreter/models/EvalResult.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Character.g.dart';

@JsonSerializable(explicitToJson: true)
class Character {
  String? name;
  String? assetPath;
  Map<String, dynamic>? props;

  Character({this.name, this.assetPath});

  static fromNode(CharacterNode node,
      Future<EvalResult> Function(BaseNode node) eval) async {
    final name =
        node.name != null ? ((await eval(node.name!)).value as String) : null;
    final assetPath = node.assetPath != null
        ? (await eval(node.assetPath!)).value as String
        : null;
    return Character(name: name, assetPath: assetPath);
  }

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
