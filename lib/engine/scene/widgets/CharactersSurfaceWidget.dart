import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/GSState.dart';

class CharactersSurfaceWidget extends ConsumerWidget {
  CharactersSurfaceWidget({required this.computeSize});

  double Function(double) computeSize;

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
            character.character.assetPath != null ? Positioned(
                left: computeSize(character.position.left ?? 0),
                bottom: computeSize(character.position.bottom ?? 0),
                top: character.position.bottom == null ? computeSize(character.position.top ?? 0) : null,
                right: character.position.left == null ? computeSize(character.position.right ?? 0) : null,
                child: SizedBox(
                  width: computeSize(character.size.width),
                  height: computeSize(character.size.height),
                  child: Image(image: AssetImage(character.character.assetPath!)),
                )
            ) : const SizedBox.shrink()
          ],
        ));
  }
}
