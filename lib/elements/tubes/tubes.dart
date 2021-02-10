import 'package:bird/elements/bird/bird.dart';
import 'package:bird/elements/points/points.dart';
import 'package:bird/elements/tubes/tube.dart';
import 'dart:math';

class Tubes implements ITubes {
  final Bird bird;
  final Points points;
  List<Tube> tubes = List<Tube>();

  Tubes(this.bird, this.points) {
    int pos = 40;
    for (int i = 0; i < 5; i++) {
      pos += 100;
      this.tubes.add(new Tube(pos, bird));
    }
  }

  @override
  void move() {
    Iterator<Tube> iterator = this.tubes.iterator;
    while (iterator.moveNext()) {
      var max = maxPosition();
      Tube tube = iterator.current;
      tube.move();
      if (tube.leftScreen()) {
        points.increase();
        tubes.remove(tube);
        Tube newTube = new Tube(max + 100, bird);
        tubes.insert(tubes.length - 1, newTube);
      }
    }
  }

  @override
  int maxPosition() {
    var _max = 0;
    for (Tube tube in tubes) {
      _max = max(tube.position, _max);
    }
    return _max;
  }

  @override
  bool colision() {
   for (Tube tube in tubes) {
       if (tube.crossedHorizontally() && tube.crossedVertically())
                return true;
    }
    return false;
  }

}

abstract class ITubes {
  void move();
  int maxPosition();
  bool colision();
}
