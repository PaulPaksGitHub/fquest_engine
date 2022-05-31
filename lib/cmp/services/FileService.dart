import 'dart:convert';
import 'dart:io';

import 'package:fquest_engine/cmp/AssetPath.dart';
import 'package:fquest_engine/cmp/ast/global/GlobalNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/scene/SceneNode.dart';
import 'package:fquest_engine/cmp/services/ErrorService.dart';

class FileService {
  writeGlobal (GlobalNode node) async {
    await File(AssetPath.COMPILED_AST_GLOBAL + 'global.ast').create(recursive: true);
    await File(AssetPath.COMPILED_AST_GLOBAL + 'global.ast').writeAsString(jsonEncode(node));
  }

  writeScene (SceneNode node) async {
    await File(AssetPath.COMPILED_AST_SCENES + node.name + '.ast').create(recursive: true);
    await File(AssetPath.COMPILED_AST_SCENES + node.name + '.ast').writeAsString(jsonEncode(node));
  }

  write (String ast) async {
    const paths = ['assets/scenario/start.ast'];
    for (final path in paths) {
      File(path).writeAsString(ast);
    }
  }

  Future<String> read({bool showLineNumbers = false}) async {
    const paths = ['assets/scenario/start.scn'];

    for (final path in paths) {
      final lines = utf8.decoder
          .bind(File(path).openRead())
          .transform(const LineSplitter());
      try {
        String text = '';

        await for (final line in lines) {
          text += '$line\n' ;
        }

        return text;
      } catch (_) {
        await _handleError(path);
      }
    }

    stderr.writeln('error: has no paths');
    return '';
  }

  Future<void> _handleError(String path) async {
    if (await FileSystemEntity.isDirectory(path)) {
      ErrorService.error(msg: 'error: $path is a directory');
    } else {
      ErrorService.error(code: 1);
    }
  }
}