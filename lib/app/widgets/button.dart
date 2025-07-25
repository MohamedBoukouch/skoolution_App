import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_images.dart'; // for image paths

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF054BB4),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    // Normalize text to lowercase for logic
    final lowerText = text.toLowerCase();

    // Detect type of button
    final isBack = lowerText.contains("back");
    final isNext = lowerText.contains("next");

    // Pick icon based on text
    final iconPath = isBack
        ? AppImages.backButton
        : isNext
            ? AppImages.nextButton
            : null;

    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: backgroundColor == Colors.white
                  ? const Color(0xFF054BB4)
                  : Colors.transparent,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isBack && iconPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(iconPath, height: 20),
              ),
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            if (isNext && iconPath != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.asset(iconPath, height: 20),
              ),
          ],
        ),
      ),
    );
  }
}
