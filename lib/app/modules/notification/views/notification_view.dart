import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skoolution/app/config/app_images.dart';
import 'package:skoolution/app/modules/notification/widgets/notifiation_box.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      appBar: AppBar(
        backgroundColor: Colors.white, // White app bar
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Black back icon
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black, // Black title text
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black), // 3-dot menu icon
            onPressed: () {
              // Add your menu functionality here
            },
          ),
        ],
      ),
      body:  Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NotificationBox(
                imagePath: AppImages.profile, 
                title: 'Nouvelle mission physique pour toi, Amina !',
                message: 'Bonjour Amina, une nouvelle activité vous attend aujourd\'hui, spécialement conçue pour booster votre confiance en physique.',
                time: DateTime.now().subtract(const Duration(days: 1)),
                isRead: false,
              ),
              NotificationBox(
                imagePath: AppImages.profile, 
                title: 'Nouvelle mission physique pour toi, Amina !',
                message: 'Bonjour Amina, une nouvelle activité vous attend aujourd\'hui, spécialement conçue pour booster votre confiance en physique.',
                time: DateTime.now().subtract(const Duration(days: 1)),
                isRead: true,
              ),
              NotificationBox(
                imagePath: AppImages.profile, 
                title: 'Nouvelle mission physique pour toi, Amina !',
                message: 'Bonjour Amina, une nouvelle activité vous attend aujourd\'hui, spécialement conçue pour booster votre confiance en physique.',
                time: DateTime.now().subtract(const Duration(days: 1)),
                isRead: true,
              ),
              NotificationBox(
                imagePath: AppImages.profile, 
                title: 'Nouvelle mission physique pour toi, Amina !',
                message: 'Bonjour Amina, une nouvelle activité vous attend aujourd\'hui, spécialement conçue pour booster votre confiance en physique.',
                time: DateTime.now().subtract(const Duration(days: 1)),
                isRead: true,
              ),
              NotificationBox(
                imagePath: AppImages.profile, 
                title: 'Nouvelle mission physique pour toi, Amina !',
                message: 'Bonjour Amina, une nouvelle activité vous attend aujourd\'hui, spécialement conçue pour booster votre confiance en physique.',
                time: DateTime.now().subtract(const Duration(days: 1)),
                isRead: true,
              ),
            ],
          ),
        )
      ),
    );
  }
}