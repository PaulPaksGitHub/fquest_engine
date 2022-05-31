import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'engine/scene/GSContainerWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    DesktopWindow.setMinWindowSize(Size(800, 600));
    // DesktopWindow.setFullScreen(true);
    // DesktopWindow.setFullScreen(false);
  }

  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
        child: MaterialApp(
      title: 'Engine (alpha)',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0x00000000)),
      home: GSContainerWidget(),
    ));
  }
}
