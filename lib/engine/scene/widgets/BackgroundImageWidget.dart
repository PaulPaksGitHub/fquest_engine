import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/GSState.dart';

class BackgroundImageWidget extends ConsumerWidget {
  const BackgroundImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundImageAssetPath =
        ref.watch(GSState.backgroundImageAssetPath);
    if (backgroundImageAssetPath != null) {
      return Image(
          image: AssetImage(backgroundImageAssetPath));
    }

    return Container(color: Colors.deepPurple);
  }
}
