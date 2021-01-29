import 'dart:math';

class Tube implements ITube {
  int position;
  double height;

  Tube(this.position) {
    height = randomHeight();
  }

  @override
  void move() {
    position -= 5;
  }

  @override
  bool leftScreen() {
    return this.position  < 0;
  }

  @override
  randomHeight() {
    var rng = new Random();
    return rng.nextInt(250).toDouble();
  }
}

abstract class ITube {
  void move();
  bool leftScreen();
  randomHeight();
}
