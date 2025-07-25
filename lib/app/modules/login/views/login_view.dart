import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/modules/home/views/home_view.dart';
import 'package:skoolution/app/modules/signup/views/pages/step_tow_signup.dart';
import 'package:skoolution/app/modules/signup/views/signup_view.dart';

import '../../../config/app_constants.dart';
import '../../../config/app_images.dart';
import '../../../widgets/button.dart';
import '../../../widgets/text_filed.dart';
import '../../verification_code/views/verification_code_view.dart';
// import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController smsController = TextEditingController();

  bool isSMSActive = false;
  bool isEmailActive = false;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 🔹 Banner Section
          Stack(
            children: [
              SizedBox(
                width: AppConstant.width,
                height: AppConstant.height * 0.4,
                child: Image.asset(
                  AppImages.loginBanner,
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
                    Image.asset(AppImages.whiteLogo, height: 40),
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
                        onPressed: () {
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
                                        const SizedBox(height: 8),
                                        Text(
                                          'Forgot password?',
                                          style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Select a contact to reset your password.',
                                          style: GoogleFonts.inter(fontSize: 13),
                                        ),
                                        const SizedBox(height: 16),                // Email field
                                        TextFiledZone(
                                          controller: emailController,
                                          hint: "Send via Email",
                                          inputType: TextInputType.emailAddress,
                                          enabled: !isSMSActive,
                                          onChanged: (value) {
                                            setState(() {
                                              isEmailActive = value.isNotEmpty;
                                              if (isEmailActive) isSMSActive = false;
                                            });
                                          },
                                          prefixIcon: Icon(Icons.email, color: Colors.blue),
                                          suffixIcon: isEmailActive
                                              ? const Icon(Icons.verified, color: Colors.blue)
                                              : null, label: '',
                                        ),

                                        // SMS field
                                        TextFiledZone(
                                          controller: smsController,
                                          hint: "Send via SMS",
                                          inputType: TextInputType.phone,
                                          enabled: !isEmailActive,
                                          onChanged: (value) {
                                            setState(() {
                                              isSMSActive = value.isNotEmpty;
                                              if (isSMSActive) isEmailActive = false;
                                            });
                                          },
                                          prefixIcon: Icon(Icons.phone, color: Colors.blue),
                                          suffixIcon: isSMSActive
                                              ? const Icon(Icons.verified, color: Colors.blue)
                                              : null, label: '',
                                        ),
                                        
                                        const SizedBox(height: 20),
                                          CustomButton(
                                            text: "Continue",
                                            onPressed: () {
                                              if ((emailController.text.isEmpty &&
                                                      smsController.text.isEmpty) ||
                                                  (emailController.text.isNotEmpty &&
                                                      smsController.text.isNotEmpty)) {
                                                Get.snackbar(
                                                  "Error",
                                                  "Please enter either Email or SMS, not both.",
                                                  backgroundColor: Colors.orange,
                                                  colorText: Colors.white,
                                                );
                                              } else {
                                                Get.to(()=>VerificationCodeView(contact: isSMSActive?smsController.text:emailController.text));
                                              }
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


                        },
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
