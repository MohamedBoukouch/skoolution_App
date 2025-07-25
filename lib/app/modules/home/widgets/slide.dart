import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_images.dart';

import '../../../config/app_constants.dart';

class Slide extends StatelessWidget {
  final String number;        
  final String text;         
  final Color color;        

  const Slide({
    super.key,
    required this.number,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(9.0),
          margin: EdgeInsets.only(right: 7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15), // softer and more visible
                blurRadius: 6,
                spreadRadius: 1,
                offset: Offset(0, 2), // small vertical shift
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon container (left green box)
              Container(
                width: AppConstant.width * .18,
                height: AppConstant.width * .18,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppConstant.width * .05),
                  child: SvgPicture.asset(
                    AppImages.closeBook,
                    width: 20,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Text column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    number,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    text,
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Positioned icon (top right)
        Positioned(
          top: 5,
          right: 10,
          child: Icon(
            Icons.arrow_forward,
            color: Colors.grey,
            weight: 6,
          ),
        ),
      ],
    );
  }
}
