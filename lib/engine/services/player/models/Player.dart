import 'package:just_audio/just_audio.dart';
import '../../../../cmp/ast/nodes/player/PlayerNode.dart';

class Player {
  PlayerNode node;

  final AudioPlayer _player = AudioPlayer();

  play (String assetPath, {bool loop = true}) async {
    _player.stop();
    _player.setAsset(assetPath);
    _player.setLoopMode(loop ? LoopMode.all : LoopMode.off);
    return _player.play();
  }

  pause () async {
    return _player.pause();
  }

  Player({required this.node});
}