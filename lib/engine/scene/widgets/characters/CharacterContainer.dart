import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/cmp/ast/nodes/show/props/animation/ShowNodeAnimation.dart';
import 'package:fquest_engine/engine/scene/entities/CharacterEntity.dart';
import 'package:fquest_engine/engine/services/animation/AnimationScheduler.dart';

class CharacterContainer extends ConsumerStatefulWidget {
  const CharacterContainer(
      {Key? key, required this.characterEntity, required this.computeSize})
      : super(key: key);

  final CharacterEntity characterEntity;
  final double Function(double) computeSize;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return CharacterContainerState();
  }
}

class CharacterContainerState extends ConsumerState<CharacterContainer> {
  double opacity = 1;
  ShowNodeAnimation? animation;

  Widget wrapOpacity(Widget child) {
    if (animation != null && animation!.fadeInDuration != null) {
      return AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: animation!.fadeInDuration!.toInt()),
        child: child,
      );
    }
    return child;
  }

  @override
  initState() {
    super.initState();

    animation = AnimationScheduler.getAnimation(widget.characterEntity);
    if (animation != null) {
      if (animation!.fadeInDuration != null) {
        opacity = 0;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          setState(() {
            opacity = 1;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final che = widget.characterEntity;
    final computeSize = widget.computeSize;

    if (che.character.assetPath != null) {
      return Positioned(
          left: computeSize(che.position.left ?? 0),
          bottom: computeSize(che.position.bottom ?? 0),
          top: che.position.bottom == null ? computeSize(
              che.position.top ?? 0) : null,
          right: che.position.left == null ? computeSize(
              che.position.right ?? 0) : null,
          child: SizedBox(
            width: computeSize(che.size.width),
            height: computeSize(che.size.height),
            child: wrapOpacity(Image(image: AssetImage(che.character.assetPath!))),
          )
      );
    }

    return const SizedBox.shrink();
  }
}