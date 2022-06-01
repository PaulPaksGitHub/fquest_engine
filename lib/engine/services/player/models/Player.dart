import 'package:just_audio/just_audio.dart';
import '../../../../cmp/ast/nodes/player/PlayerNode.dart';

import 'package:just_audio_libwinmedia/just_audio_libwinmedia.dart';

class Player {
  PlayerNode node;

  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  play (String assetPath, {bool loop = true}) async {
    if (isPlaying == true) {
      _player.dispose();
    }
    _player.setAsset(assetPath);
    _player.setLoopMode(loop ? LoopMode.all : LoopMode.off);
    isPlaying = true;
    return _player.play();
  }

  pause () async {
    isPlaying = false;
    return _player.pause();
  }

  Player({required this.node});
}