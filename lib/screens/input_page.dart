import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart.dart';

// CONSTANTS for Colors
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // STATE VARIABLES
  bool isMale = true; // Tracks selected gender
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- ROW 1: GENDER SELECTION ---
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    // TERNARY OPERATOR: If male is selected, use active color
                    color: isMale ? kActiveCardColor : kInactiveCardColor,
                    cardChild: const IconContent(
                      icon: Icons.male,
                      label: 'MALE',
                    ),
                    onPress: () => setState(() => isMale = true),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: !isMale ? kActiveCardColor : kInactiveCardColor,
                    cardChild: const IconContent(
                      icon: Icons.female,
                      label: 'FEMALE',
                    ),
                    onPress: () => setState(() => isMale = false),
                  ),
                ),
              ],
            ),
          ),

          // --- ROW 2: HEIGHT SLIDER ---
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text('cm'),
                    ],
                  ),
                  // SLIDER WIDGET
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xFFEB1555), // Pink thumb
                      overlayColor: const Color(
                        0x29EB1555,
                      ), // Translucent pink overlay
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- ROW 3: WEIGHT & AGE (Simplified for brevity) ---
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container()),
                Expanded(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}