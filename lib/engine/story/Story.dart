import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/cmp/Serializer.dart';
import 'package:fquest_engine/cmp/ast/nodes/prog/ProgNode.dart';

class _Prog extends StateNotifier<ProgNode?> {
  _Prog() : super(null);

  setStory(ProgNode? progNode) {
    state = progNode;
  }

  Future<ProgNode> loadProg() async {
    final storyAst = await rootBundle.loadString('assets/scenario/start.ast');
    final model = Serializer().deserializeAst(storyAst);
    state = model;

    return model;
  }
}

class Story {
  static final prog = StateNotifierProvider<_Prog, ProgNode?>((ref) {
    return _Prog();
  });
}
