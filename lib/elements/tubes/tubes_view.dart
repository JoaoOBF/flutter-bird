import 'package:bird/elements/tubes/tube_view.dart';
import 'package:bird/elements/tubes/tubes.dart';
import 'package:flutter/material.dart';

class TubesView extends StatelessWidget {
  final Tubes tubes;
  TubesView({Key key, this.tubes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: tubes.tubes
            .map<Widget>((tube) => CustomPaint(
                painter: TubeView(MediaQuery.of(context).size.height,
                    tube.position, tube.height)))
            .toList(),
      ),
    );
  }
}
