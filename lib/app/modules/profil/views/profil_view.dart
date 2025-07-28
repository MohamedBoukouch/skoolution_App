import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_constants.dart';
import 'package:skoolution/app/modules/profil/widgets/info.dart';

import '../../../config/app_images.dart';
import '../../notification/views/notification_view.dart';
import '../controllers/profil_controller.dart';
import '../widgets/settings_container.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: Text(
          'Profile',
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const profileAvatar(),
            SizedBox(height: 18,),
            Text("Amina El Fassi",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 18
            )
            ),
            Text("Aminaelfassi17@gmail.com",
            style: GoogleFonts.inter(
              color: Colors.grey
            ),
            ),
            const SizedBox(height: 20),
            Text(
              "Paramètres du compte",
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            SettingsContainer(
              svgAssetPath: AppImages.profileProfile,
              text: 'Données personnelles',
            ),
            const SizedBox(height: 10),
            Text(
              "Paramètres de l'application",
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            SettingsContainer(
              svgAssetPath: AppImages.langue,
              text: 'Langue',
              isLanguage: true,
            ),
            SettingsContainer(
              svgAssetPath: AppImages.notificationProfile,
              text: 'Préférences de notification',
            ),
            SettingsContainer(
              svgAssetPath: AppImages.theme,
              text: 'Thème sombre',
              isDarkMode: true,
            ),
            const SizedBox(height: 10),
            Text(
              "Paramètres de l'application",
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            SettingsContainer(
              svgAssetPath: AppImages.condition,
              text: 'Conditions générales et politiques',
            ),
            SettingsContainer(
              svgAssetPath: AppImages.about,
              text: 'à propos de skoolution',
            ),
            SettingsContainer(
              svgAssetPath: AppImages.supporte,
              text: 'Support',
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.red,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 80,),
          ],
        ),
      ),
    );
  }
}