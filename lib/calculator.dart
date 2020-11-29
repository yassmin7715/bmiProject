import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String CalculeBMI() {
    double bmi = weight / pow(height / 100, 2);
    _bmi = bmi.toDouble();
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getTips() {
    if (_bmi >= 25) {
      return 'You may have to join a Gym and follow the basics of healthy eating.';
    } else if (_bmi > 18.5) {
      return 'You have a healthy body';
    } else {
      return 'You may have to Eat more frequently.';
    }
  }
}
