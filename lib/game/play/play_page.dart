import 'package:flutter/material.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          'JOGAR',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
            decorationThickness: 4.0,
            shadows: <Shadow>[
              Shadow(
                  offset: Offset(0.0, 0.2),
                  blurRadius: 16.0,
                  color: Colors.black),
            ],
          ),
        )),
      ),
    );
  }
}
