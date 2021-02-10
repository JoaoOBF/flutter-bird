import 'package:bird/utils/sound_play.dart';

class Points implements IPoints {
  int points = 0;
  final SoundPlay soundPlay = SoundPlay('assets/coins.mp3');

  @override
  void increase() {
    points++;
    soundPlay.play();
  }
}

abstract class IPoints {
  void increase();
}
