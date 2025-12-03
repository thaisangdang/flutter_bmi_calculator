import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart.dart';

// CONSTANTS (You can move these to a separate constants.dart file later)
const kTitleTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876), // Bright Green for "Normal", etc.
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold);

const kBodyTextStyle = TextStyle(fontSize: 22.0);

class ResultsPage extends StatelessWidget {
  // Fields to receive data from the previous screen
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. TITLE
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text('Your Result', style: kTitleTextStyle),
            ),
          ),

          // 2. THE RESULT CARD
          Expanded(
            flex: 5, // Takes up 5x more space than the title
            child: ReusableCard(
              color: const Color(0xFF1D1E33), // Active Card Color
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(), style: kResultTextStyle),
                  Text(bmiResult, style: kBMITextStyle),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),

          // 3. RE-CALCULATE BUTTON
          GestureDetector(
            onTap: () {
              // Go back to the previous screen
              Navigator.pop(context);
            },
            child: Container(
              color: const Color(0xFFEB1555), // Pink Color
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
