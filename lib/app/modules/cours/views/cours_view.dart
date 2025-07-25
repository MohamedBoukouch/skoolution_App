import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_images.dart';
import 'package:skoolution/app/widgets/lecon_container.dart';

import '../../../config/app_constants.dart';
import '../../../widgets/text_filed.dart';
import '../controllers/cours_controller.dart';
import '../widgets/slideContainer.dart';

class CoursView extends GetView<CoursController> {
  CoursView({super.key});


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
            onPressed: () {},
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
                      text: "Sciences",
                      isClicked: false, 
                      onTap: () {
                        print("Sciences");
                      },
                    ),
                    SideContainer(
                      text: "Humanités",
                      isClicked: false, 
                      onTap: () {
                        print("Container tapped!");
                      },
                    ),
                    SideContainer(
                      text: "Humanités",
                      isClicked: false, 
                      onTap: () {
                        print("Container tapped!");
                      },
                    ),

                  ],
                ),
              ),
              SizedBox(height: 25,),
              LeconContainer(
                iconBackgroundColor: Color(0xFF054BB4), 
                titleText: "Mathématiques", 
                subtitleText: "12 LEÇON", 
                imagePath: AppImages.racine, 
              ),
              LeconContainer(
                iconBackgroundColor: Color(0xFF455A64), 
                titleText: "Chimie", 
                subtitleText: "12 LEÇON", 
                imagePath: AppImages.physique, 
              ),
              LeconContainer(
                iconBackgroundColor: Color(0xFF306D8B), 
                titleText: "S.V.T", 
                subtitleText: "12 LEÇON", 
                imagePath: AppImages.chemie, 
              ),
              LeconContainer(
                iconBackgroundColor: Color(0xFF007B55), 
                titleText: "Chimie", 
                subtitleText: "12 LEÇON", 
                imagePath: AppImages.svt, 
              ),
              LeconContainer(
                iconBackgroundColor: Color(0xFF8E24AA), 
                titleText: "Anglais", 
                subtitleText: "12 LEÇON", 
                imagePath: AppImages.language, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
