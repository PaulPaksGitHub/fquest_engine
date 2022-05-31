import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/engine/scene/state/GSGlobalState.dart';
import 'package:fquest_engine/engine/scene/state/GSState.dart';
import 'package:fquest_engine/engine/scene/widgets/DialogOptionsWidget.dart';

import 'widgets/BackgroundImageWidget.dart';
import 'widgets/CharacterNameWidget.dart';
import 'widgets/CharactersSurfaceWidget.dart';
import 'widgets/SpeechWidget.dart';

class GSWidget extends ConsumerStatefulWidget {
  GSWidget({Key? key, required this.sceneName}) : super(key: key);

  String sceneName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return GameSceneWidgetState();
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
    final speech = ref.watch(GSState.speech);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            if ((speech != null && speech.dialogOptions.isEmpty) || speech == null) {
              ref.read(GSGlobalState.interpreter.notifier).state?.evalNext();
            }
          },
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CharacterNameWidget(computeSize: computeSize),
                                  SpeechWidget(computeSize: computeSize),
                                ],
                              )),
                          DialogOptionsWidget(computeSize: computeSize)
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
