import 'package:flutter/material.dart';

class cardIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  cardIcon(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    const CardTextStyle = TextStyle(fontSize: 15.0, color: Colors.white);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text('text', style: CardTextStyle),
      ],
    );
  }
}
