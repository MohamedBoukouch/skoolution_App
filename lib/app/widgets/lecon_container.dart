import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_constants.dart';

class LeconContainer extends StatelessWidget {
  final int? loading; // Make loading optional
  final Color iconBackgroundColor;
  final String titleText;
  final String subtitleText;
  final String imagePath;
  final Color loadingColor;
  final Color? svgColor;
  final bool isInverse; // New parameter to control text order
  
  const LeconContainer({
    super.key,
    this.loading,
    this.iconBackgroundColor = Colors.amber,
    this.loadingColor = Colors.amber,
    required this.titleText,
    required this.subtitleText,
    required this.imagePath,
    this.svgColor,
    this.isInverse = true, // Default to true for backward compatibility
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(right: 7, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon container
          Container(
            width: AppConstant.width * .27,
            height: AppConstant.height * .12,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: loading != null
                  ? imagePath.endsWith('.svg')
                      ? SvgPicture.asset(
                          imagePath,
                          width: 15,
                          height: 15,
                          color: svgColor,
                        )
                      : Image.asset(
                          imagePath,
                          width: 24,
                          height: 24,
                        )
                  : imagePath.endsWith('.svg')
                      ? SvgPicture.asset(
                          imagePath,
                          width: 15,
                          height: 15,
                          color: svgColor ?? Colors.white,
                        )
                      : Image.asset(
                          imagePath,
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
            ),
          ),

          const SizedBox(width: 10),

          // Text column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...(loading != null
                    ? [_buildLoadingText()]
                    : [isInverse ? _buildNormalText() : _buildInverseText()]),
                const SizedBox(height: 8),
                if (loading != null) _buildProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNormalText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 19, // Increased from 17
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitleText,
          style: GoogleFonts.inter(
            fontSize: 16, // Increased from 15
            color: Colors.grey,
          ),
        ), 
      ],
    );
  }

  Widget _buildInverseText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitleText,
          style: GoogleFonts.inter(
            fontSize: 16, // Increased size
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          titleText,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 19, // Increased size
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isInverse ? subtitleText : titleText,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w800,
            fontSize: 12, // Increased from 10
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 6), // Increased from 4
        Text(
          isInverse ? titleText : subtitleText,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 12, // Increased from 10
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: LinearProgressIndicator(
            value: loading! / 100,
            backgroundColor: Colors.grey.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              loading! >= 100 
                ? const Color.fromARGB(255, 13, 255, 21) 
                : loadingColor,
            ),
            borderRadius: BorderRadius.circular(10),
            minHeight: 8,
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "$loading%",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 13, // Increased from 12
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}