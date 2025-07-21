import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_images.dart';
import 'package:skoolution/app/modules/login/views/login_view.dart';
import 'package:skoolution/app/modules/signup/views/pages/step_third%20_signup.dart';

import '../../../../config/app_constants.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/line.dart';
import '../../../../widgets/step_circle.dart';
import '../../../../widgets/text_filed.dart';
import '../../controllers/signup_controller.dart';

class StepTowSignup extends StatefulWidget {
  const StepTowSignup({super.key});

  @override
  State<StepTowSignup> createState() => _StepTowSignupState();
}

class _StepTowSignupState extends State<StepTowSignup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstant.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.blue_logo),
              const SizedBox(height: 16),
              Text(
                "Sign Up",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              // Step Indicator
              Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstant.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StepCircle(isActive:true,stepNumber:1),
                  Line(isActive:true),
                  StepCircle(isActive:true,stepNumber:2),
                  Line(isActive:true),
                  StepCircle(isActive:false,stepNumber:3),
                ],
              ),
            ),
              const SizedBox(height: 20),
              // Form Fields
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFiledZone(
                      controller: emailController,
                      label: "High school",
                      hint: "Choose your high school",
                      inputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    TextFiledZone(
                      controller: passwordController,
                      label: "School level",
                      hint: "Choose your school level",
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(height: 20),

                    // 🔹 Buttons Row
                    Row(
                      children: [
                        // Back Button (White background, blue text)
                        Expanded(
                          child: CustomButton(
                            text: "Back",
                            backgroundColor: Colors.white,
                            textColor: const Color(0xFF054BB4),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Next Button (Blue background, white text)
                        Expanded(
                          child: CustomButton(
                            text: "Next",
                            onPressed: () {
                              Get.to(StepThirdSignup());
                              // if (_formKey.currentState!.validate()) {
                              //   print("High School: ${emailController.text}");
                              //   print("Level: ${passwordController.text}");
                              // }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Already have account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.off(() => LoginView());
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
