import 'dart:async';
import 'dart:ui' as ui;

import 'package:bird/elementos/bird/bird.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class Game extends StatefulWidget {
  Game({Key key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var image;
  Timer game;
  double altura = 0.0;
  bool isImageloaded = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            color: Colors.yellow,
            child: _buildImage(),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (this.isImageloaded) {
      return new CustomPaint(
        painter: new Bird(image, altura),
      );
    } else {
      return new Center(child: new Text('loading'));
    }
  }

  Future<Null> init() async {
    final ByteData data = await rootBundle.load('assets/passaro.png');
    image = await loadImage(new Uint8List.view(data.buffer));
  }

  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageloaded = true;
        _run();
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  _run() {
    game = Timer.periodic(Duration(milliseconds: 1), (_) {
      cai();
    });
  }

  void cai() {
    bool chegouNoChao = this.altura > MediaQuery.of(context).size.height;
    if (!chegouNoChao) {
      this.altura += 5;
    } else {
      _stop();
    }
    setState(() {});
  }

  _stop() {
    this.altura = 0.0;
    game.cancel();
  }
}
