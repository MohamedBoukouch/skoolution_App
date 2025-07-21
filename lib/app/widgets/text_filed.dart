import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFiledZone extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType inputType;
  final bool obscureText;
  final bool hasError;
  final TextEditingController controller;

  const TextFiledZone({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 39, 38, 38),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: inputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF054BB4), width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }
}
