import 'package:bird/elements/tubes/tube.dart';
import 'dart:math';

class Tubes implements ITubes {
  List<Tube> tubes = List<Tube>();

  Tubes() {
    int pos = 40;
    for (int i = 0; i < 5; i++) {
      pos += 100;
      this.tubes.add(new Tube(pos));
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
        print("remove:${tube.position}");
        tubes.remove(tube);
        Tube newTube = new Tube(max + 100);
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
}

abstract class ITubes {
  void move();
  int maxPosition();
}
