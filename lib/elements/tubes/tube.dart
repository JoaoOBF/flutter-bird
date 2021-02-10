import 'dart:math';

import 'package:bird/elements/bird/bird.dart';
import 'package:bird/utils/screen_utils.dart';


class Tube implements ITube {
  final Bird bird;
  var image;
  int position;
  double height;

  Tube(this.position, this.bird) {
    height = randomHeight();
  }

  @override
  void move() {
    position -= 5;
  }

  @override
  bool leftScreen() {
    return this.position < 0;
  }

  @override
  randomHeight() {
    var rng = new Random();
    return rng.nextInt(250).toDouble();
  }

  @override
  crossedHorizontally() {
    return this.position < bird.radius;
  }

  @override
  crossedVertically() {
    return bird.altura - bird.radius < ScreenUtils.screenHeight / 2 - height ||
        bird.altura + bird.radius > ScreenUtils.screenHeight - height;
  }
}

abstract class ITube {
  void move();
  bool leftScreen();
  randomHeight();
  crossedVertically();
  crossedHorizontally();
}
