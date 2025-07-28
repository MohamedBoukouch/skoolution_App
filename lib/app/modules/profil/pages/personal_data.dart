import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skoolution/app/modules/profil/widgets/info.dart';
import 'package:skoolution/app/widgets/text_filed.dart';

import '../controllers/profil_controller.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

  final ProfilController controller = Get.put(ProfilController());

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Données personnelles',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 30.0,left: 30,top: 40,bottom: 40),
        child: Column(
          children: [
            // SizedBox(height: 20,),
            profileAvatar(),
            SizedBox(height: 40,),
            TextFiledZone(
              label: 'Nom complet',
              hint: 'Amina El Fassi', 
              controller: controller.firstNameController,
              enabled: false,
            ),
            SizedBox(height: 20,),
            TextFiledZone(
              label: 'Adresse Email',
              hint: 'Aminaelfassi17@gmail.com', 
              controller: controller.firstNameController,
              enabled: false,
            ),
            SizedBox(height: 20,),
            TextFiledZone(
              label: 'Numéro de téléphone',
              hint: '0632433033', 
              controller: controller.firstNameController,
              enabled: false,
            ),
            SizedBox(height: 20,),
            TextFiledZone(
              label: 'Ville',
              hint: 'Casablanca', 
              controller: controller.firstNameController,
              enabled: false,
            ),
            SizedBox(height: 20,),
            TextFiledZone(
              label: 'Lycée',
              hint: 'Lycée Al Majd', 
              controller: controller.firstNameController,
              enabled: false,
            ),
            SizedBox(height: 20,),
            TextFiledZone(
              label: 'Lycée',
              hint: 'Lycée Al Majd', 
              controller: controller.firstNameController,
              enabled: false,
            ),
            SizedBox(height: 20,),
            TextFiledZone(
              label: 'Niveau',
              hint: '2ème année Bac SMA', 
              controller: controller.firstNameController,
              enabled: false,
            ),
            SizedBox(height: 20,),
            TextFiledZone(
              label: 'Changer le mot de passe',
              hint: '*************', 
              controller: controller.firstNameController,
              enabled: false,
              obscureText: true,
            ),
            SizedBox(height: 20,),
            TextFiledZone(
              label: 'Langue préférée',
              hint: 'Français', 
              controller: controller.firstNameController,
              enabled: false,
            ),
            SizedBox(height: 20,),
          ],),
      ) 
    );
  }
}