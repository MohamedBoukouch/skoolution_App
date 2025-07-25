import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_constants.dart';

import '../../../config/app_images.dart';
import '../widgets/slide.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left :AppConstant.width * 0.05 , bottom: AppConstant.width*.2,top: AppConstant.width*.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Your existing header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Accueil',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                IconButton(
                  icon: Image.asset(AppImages.activeNotification, width: 20),
                  onPressed: () {},
                ),
              ],
            ),
            
            // Your content
            Text(
              "Bienvenue dans ton espace personnalisé !",
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Mon apprentissage",
              style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 13,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Slide(
                    number: "32",
                    text: "Leçons complétées",
                    color: Color(0xFF02874F) ,
                  ),
                  Slide(
                    number: "32",
                    text: "Leçons complétées",
                    color: Color(0xFFF58900) ,
                  ),
                  Slide(
                    number: "32",
                    text: "Leçons complétées",
                    color: Color(0xFF054AB4) ,
                  )
                ],
              ),
            )
            
            // Add more home content here
          ],
        ),
      ),
    );
  }
}