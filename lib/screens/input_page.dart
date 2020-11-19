import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/resusable_card.dart';
import '../components/card_content.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_botton.dart';
import 'package:flutter_calculator/brain_calculator.dart';
import '../screens/results_page.dart';

class IconGender {
  Gender gender;
  IconGender({this.gender});
}

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleColor = inActiveColor;
  // Color femaleColor = inActiveColor;
  //
  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleColor == inActiveColor) {
  //       maleColor = activeColor;
  //       femaleColor = inActiveColor;
  //     } else {
  //       maleColor = inActiveColor;
  //       // maleColor=maleColor==inActiveColor?maleColor==ActiveColor:maleColor==inActiveColor;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleColor == inActiveColor) {
  //       femaleColor = activeColor;
  //       maleColor = inActiveColor;
  //     } else {
  //       femaleColor = inActiveColor;
  //     }
  //   }
  // }

  Gender selectedgender;
  int height = 180;
  int weight = 90;
  int age = 1;

  @override
  Widget build(BuildContext context) {
    const bottomContainerColor = Colors.pink;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      colour: selectedgender == Gender.male
                          ? kActiveColor
                          : kInActiveColor,
                      cardChild: cardIcon(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      colour: selectedgender == Gender.female
                          ? kActiveColor
                          : kInActiveColor,
                      cardChild: cardIcon(FontAwesomeIcons.venus, 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kValuesTextStyle,
                        ),
                        Text('cm'),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Color(0xFFEBB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          // activeColor: Colors.white,this overwrites the properties in the SliderTheme
                          // so we have to rmove it from here and add it in the slider theme
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newvalue) {
                            setState(() {
                              height = height;
                              height = newvalue.round();
                            });
                          }),
                    ),
                  ],
                ),
                colour: kColorContainer,
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(
                          weight.toString(),
                          style: kValuesTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              myicon: FontAwesomeIcons.minus,
                              press_action: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                myicon: FontAwesomeIcons.plus,
                                press_action: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    colour: kColorContainer,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle),
                        Text(
                          age.toString(),
                          style: kValuesTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              myicon: FontAwesomeIcons.plus,
                              press_action: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              myicon: FontAwesomeIcons.minus,
                              press_action: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kColorContainer,
                  ),
                ),
              ],
            )),
            BottomButton(
              textButton: 'Calculator',
              onTapButton: () {
                BrainCalculator calculate =
                    BrainCalculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(
                        bmiValue: calculate.bmiCalculation(),
                        bmiResult: calculate.bmiResult(),
                        bmiAdvice: calculate.bmiAdvice(),
                      );
                    },
                  ),
                );
              },
            ),
          ]),
    );
  }
}
