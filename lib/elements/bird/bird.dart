import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class Bird implements IBird {
  double altura = 80.0;
  final x = 100.0;
  final radius = 40.0;
  var image;
  BuildContext context;

  Bird(this.context);

  @override
  void pula() {
    this.altura -= 150;
  }

  @override
  void cai() {
    bool chegouNoChao = this.altura > MediaQuery.of(context).size.height;
    if (!chegouNoChao) {
      this.altura += 5;
    }
  }

  Future<Null> init() async {
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
  void pula();
  void cai();
}
