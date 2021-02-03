import 'package:bird/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class TubeView extends CustomPainter {

  var random;
  var position;

  TubeView(this.position, this.random);

  @override
  void paint(Canvas canvas, Size size) async {
    final rectBottom =
        Rect.fromLTRB(position + 0.0, ScreenUtils.screenHeight - random, position - 40.0, ScreenUtils.screenHeight);
    final rectTop =
        new Rect.fromLTRB(position - 40.0, 0.0, position + 0.0, ScreenUtils.screenHeight / 2 - random);
    canvas.drawRect(rectBottom, Paint());
    canvas.drawRect(rectTop, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
