import 'package:get/get.dart';

import '../modules/cours/bindings/cours_binding.dart';
import '../modules/cours/views/cours_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/MainWrapper.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/pages/personal_data.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/verification_code/bindings/verification_ode_binding.dart';
import '../modules/verification_code/views/verification_code_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const MainWrapper(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_ODE,
      page: () => VerificationCodeView(
        contact: '',
      ),
      binding: VerificationOdeBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.COURS,
      page: () => CoursView(),
      binding: CoursBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => PersonalData(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () =>  NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
