import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_images.dart';
import 'package:skoolution/app/modules/cours/pages/test_fetch.dart';
import 'package:skoolution/app/widgets/lecon_container.dart';

import '../../../config/app_constants.dart';
import '../../../widgets/text_filed.dart';
import '../../notification/views/notification_view.dart';
import '../controllers/cours_controller.dart';
import '../widgets/slideContainer.dart';

class CourFetch extends GetView<CoursController> {
  CourFetch({super.key});


  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
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
              Get.to(()=>NotificationView());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left:AppConstant.width * 0.05,right:AppConstant.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bienvenue dans ton espace personnalisé !",
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              TextFiledZone(
                label: '', 
                controller: searchController, 
                hint: 'Recherch lecon, test une métière ',
                prefixIcon: Icon(Icons.search),
              ),
              SizedBox(height: 25,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SideContainer(
                      text: "Toutes",
                      isClicked: true, 
                      onTap: () {
                        print("Langues");
                      },
                    ),
                    SideContainer(
                      text: "1er semestre",
                      isClicked: false, 
                      onTap: () {
                        print("1er semestre");
                      },
                    ),
                    SideContainer(
                      text: "2eme semestre",
                      isClicked: false, 
                      onTap: () {
                        print("2eme semestre");
                      },
                    ),

                  ],
                ),
              ),
              SizedBox(height: 25,),
              InkWell(
                onTap: (){
                  Get.to(()=>TestFetch());
                },
                child: LeconContainer(
                  loading: 40, 
                  iconBackgroundColor: Color(0xFFE1EBF4), 
                  loadingColor: Color(0xFF135EA5), 
                  titleText: "Limites et continuité", 
                  subtitleText: "3 Chapitres", 
                  imagePath: AppImages.racine, 
                  isInverse: true,
                ),
              ),
              LeconContainer(
                loading: 40,
                iconBackgroundColor: Color(0xFFE1EBF4), 
                loadingColor: Color(0xFF135EA5),
                titleText: "Dérivation et étude de fon...", 
                subtitleText: "3 Chapitres", 
                imagePath: AppImages.racine,
                svgColor:Color(0xFF135EA5)
              ),
              LeconContainer(
                loading: 40,
                iconBackgroundColor: Color(0xFFE1EBF4), 
                loadingColor: Color(0xFF135EA5),
                titleText: "Dérivation et étude de fon...", 
                subtitleText: "3 Chapitres", 
                imagePath: AppImages.racine,
                svgColor:Color(0xFF135EA5) 
              ),
              LeconContainer(
                loading: 40,
                iconBackgroundColor: Color(0xFFE1EBF4), 
                loadingColor: Color(0xFF135EA5),
                titleText: "Les suites numériques", 
                subtitleText: "3 Chapitres", 
                imagePath: AppImages.racine,
                svgColor:Color(0xFF135EA5) 
              ),
              LeconContainer(
                loading: 40,
                iconBackgroundColor: Color(0xFFE1EBF4), 
                loadingColor: Color(0xFF135EA5),
                titleText: "Les fonctions logarithmes", 
                subtitleText: "3 Chapitres", 
                imagePath: AppImages.racine,
                svgColor:Color(0xFF135EA5) 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
