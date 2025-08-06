import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionCard extends StatelessWidget {
  final String question;

  const QuestionCard({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: GoogleFonts.inter(
        fontSize: 18,
        height: 1.4,
      ),
    );
  }
}