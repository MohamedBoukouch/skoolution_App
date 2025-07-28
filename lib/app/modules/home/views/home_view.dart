import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_constants.dart';
import 'package:skoolution/app/modules/notification/views/notification_view.dart';

import '../../../config/app_images.dart';
import '../../../widgets/lecon_container.dart';
import '../../notification/widgets/notifiation_box.dart';
import '../widgets/slide.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
              'Accueil',
              style: GoogleFonts.inter(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppImages.activeNotification, width: 20), 
            onPressed: () {
              Get.to(NotificationView());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left :AppConstant.width * 0.05 , bottom: AppConstant.width*.2,top: AppConstant.width*.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your content
              Text(
                "Bienvenue dans ton espace personnalisé !",
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: 15,
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
              //TOP SLIDES
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
              ),
      
              SizedBox(
                height: 20,
              ),
              Text("Bravo Amina ! 👏 ",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.blue
                ),
              ),
              Text("Tu fais de super progrès cette semaine 🎉",
                style: GoogleFonts.inter(
                  // fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.blue
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text("Mes leçons en cours",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black
                ),
              ),
              SizedBox(
                height: 13,
              ),
              LeconContainer(
                loading: 40, 
                iconBackgroundColor: Color(0xFFE1EBF4), 
                loadingColor: Color(0xFF135EA5), 
                titleText: "Limites et continuité", 
                subtitleText: "Chapitre 5 • test 4", 
                imagePath: AppImages.racine, 
              ),
              LeconContainer(
                loading: 40, 
                iconBackgroundColor: Color(0xFFDFEEEA), 
                loadingColor: Color(0xFF007B55), 
                titleText: "Les réactions responsables de la... ", 
                subtitleText: "Chapitre 5 • test 4", 
                imagePath: AppImages.monde, 
              ),
              LeconContainer(
                loading: 40, 
                iconBackgroundColor: Color(0xFFE8EAEB), 
                loadingColor: Color(0xFF455A64), 
                titleText: "Décroissance radioactive", 
                subtitleText: "Chapitre 5 • test 4", 
                imagePath: AppImages.physique, 
              ),
              LeconContainer(
                loading: 40, 
                iconBackgroundColor: Color(0xFFF1E3F4), 
                loadingColor: Color(0xFF8E24AA), 
                titleText: "Anglais ", 
                subtitleText: "Chapitre 5 • test 4", 
                imagePath: AppImages.language, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}