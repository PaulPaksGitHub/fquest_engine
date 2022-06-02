import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/cmp/ast/nodes/hide/HideNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/hide/props/animation/HideNodeAnimation.dart';
import 'package:fquest_engine/cmp/ast/nodes/show/props/animation/ShowNodeAnimation.dart';
import 'package:fquest_engine/engine/scene/entities/CharacterEntity.dart';
import 'package:fquest_engine/engine/services/animation/AnimationScheduler.dart';

import '../../state/GSState.dart';

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
  Duration opacityDuration = const Duration(milliseconds: 0);
  ShowNodeAnimation? showAnim;
  HideNodeAnimation? hideAnim;

  Widget wrapOpacity(Widget child) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: opacityDuration,
      child: child,
    );
  }

  late final Function() removeListener;

  @override
  dispose() {
    removeListener();

    super.dispose();
  }

  @override
  initState() {
    super.initState();

    removeListener =
        AnimationScheduler.addListener(widget.characterEntity, (value) {
          if (value.runtimeType == HideNode) {
            value as HideNode;

            if (value.props.animation != null) {
              if (value.props.animation!.fadeOutDuration != null) {
                setState(() {
                  opacityDuration = Duration(milliseconds: value.props.animation!.fadeOutDuration!.toInt());
                  opacity = 0;
                });

                Future.delayed(Duration(milliseconds: value.props.animation!.fadeOutDuration!.toInt()), () {
                  ref.read(GSState.characters.notifier).hide(widget.characterEntity);
                });
              }
            }
          }
        });

    final showAnim = AnimationScheduler.getAnimation(widget.characterEntity);
    if (showAnim != null) {
      if (showAnim!.fadeInDuration != null) {
        opacity = 0;
        opacityDuration =
            Duration(milliseconds: showAnim!.fadeInDuration!.toInt());
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
            child: wrapOpacity(
                Image(image: AssetImage(che.character.assetPath!))),
          )
      );
    }

    return const SizedBox.shrink();
  }
}