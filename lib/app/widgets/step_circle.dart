import 'package:flutter/material.dart';
import 'package:skoolution/app/config/app_constants.dart';

class StepCircle extends StatelessWidget {
  final bool isActive;
  final int stepNumber;
  const StepCircle({super.key, required this.isActive, required this.stepNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: AppConstant.width*.11,
          height: AppConstant.width*.11,
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.blue[100],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isActive
                ? Icon(Icons.check, color: Colors.white, size: 18)
                : Text(
                    '$stepNumber',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Step $stepNumber',
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.blue[200],
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}