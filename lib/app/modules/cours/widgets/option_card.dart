import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/question_model.dart';

class OptionCard extends StatelessWidget {
  final Option option;
  final bool isSelected;
  final bool answerChecked;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.answerChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final showResult = answerChecked && (isSelected || option.isCorrect);
    
    Color borderColor = Colors.grey[300]!;
    Color bgColor = Colors.white;
    Color textColor = Colors.black;
    Widget? trailingIcon;

    if (showResult) {
      if (option.isCorrect) {
        borderColor = Colors.green;
        bgColor = Colors.green[50]!;
        trailingIcon = Icon(Icons.check, color: Colors.green);
      } else if (isSelected) {
        borderColor = Colors.red;
        bgColor = Colors.red[50]!;
        trailingIcon = Icon(Icons.close, color: Colors.red);
      }
    } else if (isSelected) {
      borderColor = Colors.blue;
      bgColor = Colors.blue[50]!;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: showResult && option.isCorrect
                    ? Colors.green
                    : isSelected
                        ? borderColor
                        : Colors.transparent,
                border: Border.all(
                  color: showResult && option.isCorrect
                      ? Colors.green
                      : borderColor,
                ),
              ),
              child: Text(
                option.letter,
                style: GoogleFonts.inter(
                  color: isSelected || (showResult && option.isCorrect)
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                option.text,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: textColor,
                ),
              ),
            ),
            if (trailingIcon != null) trailingIcon,
          ],
        ),
      ),
    );
  }
}