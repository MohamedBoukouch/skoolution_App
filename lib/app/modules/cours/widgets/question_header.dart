import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionHeader extends StatelessWidget {
  final String title;
  final String chapter;
  final int currentIndex;
  final int totalQuestions;

  const QuestionHeader({
    super.key,
    required this.title,
    required this.chapter,
    required this.currentIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue[800],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              chapter,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Text(
          '$currentIndex/$totalQuestions',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}