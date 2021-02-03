import 'package:bird/elements/bird/bird.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BirdView extends CustomPainter {
  Bird bird;
  BirdView(this.bird);

  @override
  void paint(Canvas canvas, Size size) async {
    canvas.drawCircle(Offset(bird.x - 50, bird.altura), bird.radius, new Paint());
    canvas.drawImage(bird.image, new Offset(10.0, bird.altura - bird.radius), new Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
