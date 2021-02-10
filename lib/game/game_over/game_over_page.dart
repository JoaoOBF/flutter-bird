import 'package:flutter/material.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
      onTap: () {
         Navigator.of(context).pushNamed('/game');
      },
      child: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/background.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Center(
            child: Text(
          'GAME OVER',
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.w600,
            decorationThickness: 4.0,
            shadows: <Shadow>[
              Shadow(
                  offset: Offset(0.0, 0.8),
                  blurRadius: 6.0,
                  color: Colors.red),
            ],
          ),
        )),
      ),
    ),
    );
  }
}
