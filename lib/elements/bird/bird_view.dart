import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BirdView extends CustomPainter {
  var altura;
  ui.Image image;
  BirdView(this.image, this.altura);

  @override
  void paint(Canvas canvas, Size size) async {
    canvas.drawImage(image, new Offset(0.0, altura), new Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
