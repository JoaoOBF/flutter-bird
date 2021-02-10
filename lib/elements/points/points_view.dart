import 'package:flutter/material.dart';

class PointsView extends StatelessWidget {
  final points;
  const PointsView({Key key, this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      points,
      style: TextStyle(
        color: Colors.white,
        fontSize: 45,
        fontWeight: FontWeight.w600,
        decorationThickness: 4.0,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(0.0, 0.2),
            blurRadius: 16.0,
            color: Colors.black
          ),
          
        ],
      ),
    );
  }
}
