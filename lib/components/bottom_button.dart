import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.textButton, this.onTapButton});
  String textButton;
  Function onTapButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        child: Center(child: Text(textButton, style: kLargeButtonTextStyle)),
        color: Colors.pink,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
