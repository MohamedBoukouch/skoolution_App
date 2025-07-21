import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_images.dart';
import 'package:skoolution/app/modules/login/views/login_view.dart';
import 'package:skoolution/app/modules/signup/views/pages/step_tow_signup.dart';
import '../../../widgets/button.dart';
import '../../../widgets/line.dart';
import '../../../widgets/step_circle.dart';
import '../../../widgets/text_filed.dart';
import '../controllers/signup_controller.dart';
import '../../../config/app_constants.dart'; // Assuming AppConstant is here

class SignupView extends GetView<SignupController> {
   SignupView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.blue_logo),
            SizedBox(height: 16),
            Text(
              "Sign Up",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            // Step Indicator
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstant.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StepCircle(isActive:true,stepNumber:1),
                  Line(isActive:true),
                  StepCircle(isActive:false,stepNumber:2),
                  Line(isActive:false),
                  StepCircle(isActive:false,stepNumber:3),
                ],
              ),
            ),
            Padding(
            padding: EdgeInsets.all(AppConstant.height * 0.02),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔸 Email Field
                  TextFiledZone(
                    controller: emailController,
                    label: "Email",
                    hint: "Ajoutez votre email",
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),

                  // 🔸 Password Field
                  TextFiledZone(
                    controller: passwordController,
                    label: "Mot de passe",
                    hint: "Ajoutez votre mot de passe",
                    inputType: TextInputType.text,
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  // 🔸 Login Button
                  const SizedBox(height: 15),
                  CustomButton(
                    text: "Next",
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                        // print("Login with: ${emailController.text}");
                      // }
                      Get.to(StepTowSignup());
                    },
                  ),

                  // 🔸 LoIn
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Already have an account ?",
                             style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(LoginView());
                        },
                        child: Text(
                          'Log In',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Center(
                  //   child: Text(
                  //     "Vous n'avez pas de compte ? Inscrivez-vous",
                  //     style: GoogleFonts.inter(color: Colors.grey),
                  //   ),
                  // ),
                ],
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
