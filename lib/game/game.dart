import 'dart:async';
import 'package:bird/elements/bird/bird.dart';
import 'package:bird/elements/bird/bird_view.dart';
import 'package:bird/elements/tubes/tubes.dart';
import 'package:bird/elements/tubes/tubes_view.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  Game({Key key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Timer game;
  Bird bird;
  Tubes tubes;

  bool isLoadedElements = false;
  bool isRun = false;

  @override
  void initState() {
    bird = Bird(context);
    tubes = Tubes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isRun) {
          bird.pula();
        } else {
          _run();
        }
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
                  TubesView(tubes: tubes)
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
    game = Timer.periodic(Duration(microseconds: 10000), (_) {
      isRun = true;
       bird.cai();
      tubes.move();
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
