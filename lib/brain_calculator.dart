import 'dart:math';

class BrainCalculator {
  BrainCalculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String bmiCalculation() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiResult() {
    if (_bmi >= 25) {
      return 'you are overweight';
    } else if (_bmi < 25) {
      return 'you are underweight';
    } else {
      return "your weight is perfect";
    }
  }

  String bmiAdvice() {
    if (_bmi >= 25) {
      return 'you are overweight,please try to loose some weight as fast as possible honey';
    } else if (_bmi < 25) {
      return 'you are underweight,try to gain some weight you friend,thats harmful';
    } else {
      return "your weight is perfect,stay as you are ";
    }
  }
}
