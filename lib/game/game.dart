import 'dart:async';
import 'dart:ui' as ui;

import 'package:bird/elements/bird/bird.dart';
import 'package:bird/elements/bird/bird_view.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class Game extends StatefulWidget {
  Game({Key key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Timer game;
  Bird bird;

  bool isLoadedElements = false;

  @override
  void initState() {
    bird = Bird(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bird.pula();
         setState(() {});
      },
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          initialData: false,
          builder: (_, snap) {
            if (snap.hasData && snap.data) {
              return Stack(
                children: [
                  CustomPaint(
                    painter: BirdView(bird.image, bird.altura),
                  ),
                ],
              );
            }
            return new Center(child: new Text('loading'));
          },
          future: _initElements(),
        ),
      ),
    );
  }

  _run() {
    game = Timer.periodic(Duration(milliseconds: 10), (_) {
      bird.cai();
      setState(() {});
    });
  }

  _stop() {
    game.cancel();
  }

  Future<bool> _initElements() async {
    if (isLoadedElements) {
      return true;
    }

    await bird.init();
    isLoadedElements = true;
   // _run();
    return true;
  }
}
