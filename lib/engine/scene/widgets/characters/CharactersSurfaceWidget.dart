import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/engine/scene/widgets/characters/CharacterContainer.dart';

import '../../state/GSState.dart';

class CharactersSurfaceWidget extends ConsumerWidget {
  const CharactersSurfaceWidget({Key? key, required this.computeSize}) : super(key: key);

  final double Function(double) computeSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characters = ref.watch(GSState.characters);

    return Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: Stack(
          children: [for (var character in characters)
            CharacterContainer(characterEntity: character, computeSize: computeSize)
          ],
        ));
  }
}
