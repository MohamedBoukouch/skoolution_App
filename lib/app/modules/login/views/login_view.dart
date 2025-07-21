import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/app_images.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('LoginView'),
        // centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset(AppImages.logo),
        ],
      )
    );
  }
}
