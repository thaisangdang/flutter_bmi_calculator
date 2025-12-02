import 'package:flutter/material.dart';

// REUSABLE CARD WIDGET
// This widget is the 'container' for all our inputs (Gender, Height, Weight).
class ReusableCard extends StatelessWidget {
  
  // Properties are final because this is a Stateless widget
  final Color color;
  final Widget? cardChild; // The content inside (Icon, Slider, etc.)
  final VoidCallback? onPress; // Function to run when tapped

  const ReusableCard({
    super.key, 
    required this.color, 
    this.cardChild, 
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // Pass the tap event up
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color, // Dynamic color
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}