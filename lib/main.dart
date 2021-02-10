import 'package:bird/game/game.dart';
import 'package:bird/game/game_over/game_over_page.dart';
import 'package:bird/game/play/play_page.dart';
import 'package:bird/utils/screen_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      ScreenUtils.init(constraints);
      return MaterialApp(
          title: 'Flutter Bird',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            '/game': (context) => Game(),
            '/game-over': (context) => GameOverPage(),
          },
          home: Scaffold(
            body: PlayPage(),
          ));
    });
  }
}
