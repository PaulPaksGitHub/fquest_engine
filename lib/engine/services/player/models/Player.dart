// import 'package:just_audio_libwinmedia/just_audio_libwinmedia.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../cmp/ast/nodes/player/PlayerNode.dart';


class Player {
  PlayerNode node;

  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  play (String assetPath, {bool loop = true}) async {
    if (isPlaying == true) {
      _player.stop();
    }

    final asset = await rootBundle.load(assetPath);
    final dir = await getApplicationDocumentsDirectory();
    var file = File(dir.path + "/" + assetPath);
    await file.create(recursive: true);
    file.writeAsBytesSync(asset.buffer.asInt8List());

    _player.setFilePath(file.path);
    await _player.setLoopMode(loop ? LoopMode.all : LoopMode.off);
    isPlaying = true;

    return await _player.play();
  }

  pause () async {
    isPlaying = false;
    return _player.pause();
  }

  Player({required this.node});
}