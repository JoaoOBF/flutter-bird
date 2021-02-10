import 'package:assets_audio_player/assets_audio_player.dart';

class SoundPlay {
  final assetsAudioPlayer = AssetsAudioPlayer();

  SoundPlay(String sound) {
    assetsAudioPlayer.open(
      Audio(sound),
    );
  }

  play() {
    assetsAudioPlayer.play();
  }

  stop() {
    assetsAudioPlayer.stop();
  }
}
