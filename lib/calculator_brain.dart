import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  // Private variable to store result
  double _bmi = 0;

  CalculatorBrain({required this.height, required this.weight});

  // 1. Calculate the raw number
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    // toStringAsFixed(1) keeps only 1 decimal place (e.g., 24.5)
    return _bmi.toStringAsFixed(1);
  }

  // 2. Get the result category
  String getResult() {
    if (_bmi >= 25) return 'Overweight';
    if (_bmi > 18.5) return 'Normal';
    return 'Underweight';
  }

  // 3. Get the advice sentence
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
