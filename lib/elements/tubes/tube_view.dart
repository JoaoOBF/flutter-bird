import 'package:flutter/material.dart';

class TubeView extends CustomPainter {
  var altura;
  var random;
  var position;

  TubeView(this.altura, this.position, this.random);

  @override
  void paint(Canvas canvas, Size size) async {
    final rectBottom =
        Rect.fromLTRB(position + 0.0, altura - random, position - 40.0, altura);
    final rectTop =
        new Rect.fromLTRB(position - 40.0, 0.0, position + 0.0, altura / 2 - random);
    canvas.drawRect(rectBottom, Paint());
    canvas.drawRect(rectTop, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
