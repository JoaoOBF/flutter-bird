import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class Bird extends CustomPainter {
  var altura;
  Bird(this.image, this.altura);

  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) async {
    canvas.drawImage(image, new Offset(0.0, altura), new Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
