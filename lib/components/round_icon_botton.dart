import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.myicon, this.press_action});
  final IconData myicon;
  final Function press_action;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: press_action,
      child: Icon(myicon),
      elevation: 6.0, //this is not used when onPressed is used
      shape: CircleBorder(),
      fillColor: Color(0xFFa2aaad),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
