import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/engine/scene/entities/SpeechEntity.dart';
import 'package:fquest_engine/engine/services/animation/AnimationScheduler.dart';

import '../../styles/ColorsScheme.dart';
import '../state/GSState.dart';

class SpeechWidget extends ConsumerStatefulWidget {
  const SpeechWidget({Key? key, required this.computeSize}) : super(key: key);

  final double Function(double) computeSize;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SpeechWidgetState();
  }
}

class _SpeechWidgetState extends ConsumerState<SpeechWidget> {
  String speechText = '';

  SpeechEntity? currentSpeech;

  setText(SpeechEntity? entity) async {
    if (entity != null) {
      setState((){ speechText = ''; });
      currentSpeech = entity;

      AnimationScheduler.scheduleAnimation('speechText', true);

      for (int i = 0; i < entity.text.length; i++) {
        if (entity != currentSpeech || speechText.length >= entity.text.length) return;

        final symbol = entity.text[i];
        await Future.delayed(const Duration(milliseconds: 15), () async {
          final needSetFull = AnimationScheduler.getAnimation('speechTextSetFull');

          if (needSetFull != null && needSetFull) {
            setState(() {
              if (entity == currentSpeech) {
                speechText = entity.text;
              }
            });
          } else {
            setState((){
              if (entity == currentSpeech) {
                speechText += symbol;
              }
            });
          }

        });
      }

      AnimationScheduler.getAnimation('speechText');
    }
  }

  @override
  initState () {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final speech = ref.watch(GSState.speech);
    final computeSize = widget.computeSize;

    ref.listen<SpeechEntity?>(GSState.speech, (previous, next) {
      setText(next);
    });

    if (speech != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: computeSize(180.0),
          minWidth: double.maxFinite,
        ),
        child: Container(
          child: Text(
            speechText,
            style: TextStyle(
              fontSize: computeSize(20.0),
              height: 30 / 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: ColorsScheme.replicaText,
            ),
          ),
          decoration: BoxDecoration(
              color: ColorsScheme.replicaAreaBackground,
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(
              vertical: computeSize(30.0), horizontal: computeSize(40.0)),
        ),
      );
    }

    return SizedBox.shrink();
  }
}
