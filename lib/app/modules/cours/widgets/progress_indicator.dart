import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int currentValue;
  final int maxValue;

  const CustomProgressIndicator({
    super.key,
    required this.currentValue,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: currentValue / maxValue,
      backgroundColor: Colors.grey[200],
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
      minHeight: 6,
    );
  }
}