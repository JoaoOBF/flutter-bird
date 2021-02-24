import 'dart:ffi';

class Time {
  double current = 0;

  double getCurrent() {
    return current;
  }

  void pass() {
    current += -0.1;
  }

  void restart() {
    current = 0;
  }
}
