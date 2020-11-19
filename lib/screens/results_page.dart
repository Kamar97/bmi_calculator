import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/resusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiValue, this.bmiResult, this.bmiAdvice});
  final String bmiValue;
  final String bmiResult;
  final String bmiAdvice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kTitleText),
            )),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: Color(0xFF3D4060),
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      bmiResult,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiValue,
                      style: kOverweightResult,
                    ),
                    Text(
                      bmiAdvice,
                      style: kBMIText,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: BottomButton(
              textButton: 'RE-CALCULATE',
              onTapButton: () {
                Navigator.pop(context);
              },
            ))
          ],
        ));
  }
}
