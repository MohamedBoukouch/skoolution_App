import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_images.dart';
import 'package:skoolution/app/modules/home/views/home_view.dart';

import '../../../widgets/button.dart';
import '../../../widgets/text_filed.dart';
import '../../home/views/MainWrapper.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  ResetPasswordView({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Your new password must be different from the previously used password.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 32),
                TextFiledZone(
                  controller: passwordController,
                  label: "New Password",
                  hint: "Enter your new password",
                  inputType: TextInputType.text,
                  obscureText: !_showPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Removed setState wrapper since we're using GetView
                      _showPassword = !_showPassword;
                      // Force rebuild
                      (context as Element).markNeedsBuild();
                    },
                  ),
                ),
                const SizedBox(height: 16),
                TextFiledZone(
                  controller: confirmPasswordController,
                  label: "Confirm Password",
                  hint: "Re-enter your new password",
                  inputType: TextInputType.text,
                  obscureText: !_showConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showConfirmPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Removed setState wrapper since we're using GetView
                      _showConfirmPassword = !_showConfirmPassword;
                      // Force rebuild
                      (context as Element).markNeedsBuild();
                    },
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: "Confirm",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
                        Get.snackbar(
                          'Error',
                          'Please fill in both password fields',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }
                      if (passwordController.text != confirmPasswordController.text) {
                        Get.snackbar(
                          'Error',
                          'Passwords do not match',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                          ),
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom,
                                    left: 20,
                                    right: 20,
                                    top: 20,
                                  ),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          width: 50,
                                          height: 3,
                                        ),
                                        const SizedBox(height: 20),
                                        SvgPicture.asset(AppImages.congratolation),
                                        const SizedBox(height: 20),
                                        Text(
                                          'Password changed.',
                                          style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Center(
                                          child: Text(
                                            'Password changed successfully, you can log in with your new password.',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.inter(fontSize: 13, ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                          CustomButton(
                                            text: "Continue",
                                            onPressed: () {
                                              Get.off(()=>MainWrapper());
                                            },
                                          ),
                                        const SizedBox(height: 30),
                                      ]
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}