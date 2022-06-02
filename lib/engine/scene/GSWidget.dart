import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/engine/scene/state/GSGlobalState.dart';
import 'package:fquest_engine/engine/scene/state/GSState.dart';
import 'package:fquest_engine/engine/scene/widgets/DialogOptionsWidget.dart';
import 'package:fquest_engine/engine/services/animation/AnimationScheduler.dart';

import 'widgets/BackgroundImageWidget.dart';
import 'widgets/CharacterNameWidget.dart';
import 'widgets/characters/CharactersSurfaceWidget.dart';
import 'widgets/SpeechWidget.dart';

class GSWidget extends ConsumerStatefulWidget {
  GSWidget({Key? key, required this.sceneName}) : super(key: key);

  String sceneName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return GameSceneWidgetState();
  }
}

class GoNextIntent extends Intent {
  const GoNextIntent();
}

class GoNextAction extends Action<GoNextIntent > {
  GoNextAction(this.ref);

  final WidgetRef ref;

  @override
  Object? invoke(covariant GoNextIntent intent) {
    final isTextAnimationActive = AnimationScheduler.getAnimation('speechText');

    if (isTextAnimationActive != null && isTextAnimationActive) {
      AnimationScheduler.scheduleAnimation('speechTextSetFull', true);
    } else {
      final speech = ref.read(GSState.speech.notifier).state;
      if ((speech != null && speech.dialogOptions.isEmpty) ||
          speech == null) {
        ref.read(GSGlobalState.interpreter.notifier).state?.evalNext();
      }
    }
    return null;
  }
}

class GameSceneWidgetState extends ConsumerState<GSWidget> {
  double computeRealSize(BoxConstraints constraints, double initialSize) {
    return constraints.minHeight / 1080 * initialSize;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Actions(
          actions: {
            GoNextIntent: GoNextAction(ref)
          },
          child: Builder(
            builder: (context) => RawKeyboardListener(
              autofocus: true,
              onKey: (event) {
                if (event.isKeyPressed(LogicalKeyboardKey.space) || event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
                  Actions.invoke<GoNextIntent>(context, const GoNextIntent());
                }
              },
                focusNode: FocusNode(),
                child: GestureDetector(
                  onTap: Actions.handler<GoNextIntent>(context, const GoNextIntent()),
                  child: AspectRatio(
                    aspectRatio: 1920 / 1080,
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        double computeSize(double size) {
                          return computeRealSize(constraints, size);
                        }

                        return Stack(
                          children: [
                            BackgroundImageWidget(),
                            CharactersSurfaceWidget(computeSize: computeSize),
                            Container(
                              margin: EdgeInsets.only(
                                  left: computeSize(200.0),
                                  right: computeSize(200.0),
                                  bottom: computeSize(30)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                          flex: 943,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              CharacterNameWidget(
                                                  computeSize: computeSize),
                                              SpeechWidget(computeSize: computeSize),
                                            ],
                                          )),
                                      DialogOptionsWidget(computeSize: computeSize)
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}
