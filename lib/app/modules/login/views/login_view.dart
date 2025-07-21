import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/modules/signup/views/pages/step_tow_signup.dart';
import 'package:skoolution/app/modules/signup/views/signup_view.dart';

import '../../../config/app_constants.dart';
import '../../../config/app_images.dart';
import '../../../widgets/button.dart';
import '../../../widgets/text_filed.dart';
// import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔹 Banner Section
          Stack(
            children: [
              SizedBox(
                width: AppConstant.width,
                height: AppConstant.height * 0.4,
                child: Image.asset(
                  AppImages.login_banner,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: AppConstant.width,
                height: AppConstant.height * 0.4,
                color: Colors.black.withOpacity(0.3),
              ),
              Positioned(
                bottom: AppConstant.height * 0.05,
                left: AppConstant.width * 0.04,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bienvenue à",
                      style: GoogleFonts.inter(
                        fontSize: AppConstant.titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(AppImages.white_logo, height: 40),
                    const SizedBox(height: 7),
                    Text(
                      "La platefome d’éducation n°1 au Maroc.",
                      style: GoogleFonts.inter(
                        fontSize: AppConstant.subtitleFontSize,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // 🔹 Form Section
          Padding(
            padding: EdgeInsets.all(AppConstant.height * 0.02),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔸 Title
                  Text(
                    "Login",
                    style: GoogleFonts.inter(
                      fontSize: AppConstant.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

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

                  // 🔸 Checkbox + Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            activeColor: const Color(0xFF09CA67),
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                          ),
                          Text(
                            'Se souvenir de moi',
                            style: GoogleFonts.inter(fontSize: 14),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Mot de passe oublié ?',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // 🔸 Login Button
                  const SizedBox(height: 15),
                  CustomButton(
                    text: "Se connecter",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Login with: ${emailController.text}");
                        Get.to(StepTowSignup());
                      }
                    },
                  ),

                  // 🔸 Sign Up
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Vous n'avez pas de compte ?",
                             style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(SignupView());
                        },
                        child: Text(
                          'Inscrivez-vous',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600
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
          ),
        ],
      ),
    );
  }
}
