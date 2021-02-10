import 'dart:async';
import 'package:bird/elements/bird/bird.dart';
import 'package:bird/elements/bird/bird_view.dart';
import 'package:bird/elements/points/points.dart';
import 'package:bird/elements/points/points_view.dart';
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
  Points points;
  bool isLoadedElements = false;
  bool isRun = false;

  @override
  void initState() {
    bird = Bird(context);
    points = Points();
    tubes = Tubes(bird, points);

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
                  new Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/background.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  CustomPaint(
                    painter: BirdView(bird),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 108.0),
                    child: TubesView(tubes: tubes),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: PointsView(
                      points: '${points.points}',
                    ),
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
    game = Timer.periodic(Duration(milliseconds: 100), (_) {
      isRun = true;
      bird.cai();
      tubes.move();
      if (tubes.colision()) {
        _stop();
      }
      setState(() {});
    });
  }

  _stop() {
    isRun = false;
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
