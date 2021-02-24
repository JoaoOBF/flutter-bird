import 'dart:async';
import 'dart:typed_data';

import 'package:bird/elements/time/time.dart';
import 'package:bird/utils/sound_play.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class Bird implements IBird {
  double altura = 80.0;
  Time time;
  final x = 100.0;
  final radius = 40.0;
  final SoundPlay soundPlay = SoundPlay('assets/fly.mp3');
  var image;
  BuildContext context;

  Bird(this.context, this.time);

  @override
  void jump() {
    this.time.restart();
    if (this.altura < 0) {
      this.altura = 0;
    }

    soundPlay.play();
  }

  @override
  void fall() {
    bool onthefloor =
        this.altura + this.radius > MediaQuery.of(context).size.height;
    double current = this.time.getCurrent();
    double newHeight = -5 + ((10 * (current * current)) / 2);
    if (!onthefloor) {
      this.altura += newHeight;
    }
  }

  Future<Null> init() async {
    altura = MediaQuery.of(context).size.height / 2;
    final ByteData data = await rootBundle.load('assets/passaro.png');
    image = await _loadImage(new Uint8List.view(data.buffer));
    return;
  }

  Future<ui.Image> _loadImage(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }
}

abstract class IBird {
  void jump();
  void fall();
}
