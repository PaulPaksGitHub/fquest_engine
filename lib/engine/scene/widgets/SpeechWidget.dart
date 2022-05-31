import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../styles/ColorsScheme.dart';
import '../state/GSState.dart';

class SpeechWidget extends ConsumerWidget {
  SpeechWidget({required this.computeSize});

  double Function(double) computeSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speech = ref.watch(GSState.speech);

    if (speech != null) {
      return (Container(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: computeSize(180.0),
            minWidth: double.maxFinite,
          ),
          child: Container(
            child: Text(
              speech != null ? speech.text : '',
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
        ),
      ));
    }

    return SizedBox.shrink();
  }
}
