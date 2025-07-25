import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_colors.dart';

class SideContainer extends StatelessWidget {
  final String text; // Text parameter
  final bool isClicked; // Click state parameter
  final VoidCallback? onTap; // Optional tap callback
  
  const SideContainer({
    super.key,
    required this.text,
    required this.isClicked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isClicked ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: isClicked ? null : Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: isClicked ? Colors.white : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}