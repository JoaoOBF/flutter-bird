class Points implements IPoints {
  int points = 0;

  @override
  void increase() {
    points++;
  }
}

abstract class IPoints {
  void increase();
}
