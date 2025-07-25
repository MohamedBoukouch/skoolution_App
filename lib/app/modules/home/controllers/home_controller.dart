import 'package:get/get.dart';
import 'package:skoolution/app/modules/signup/views/signup_view.dart';
import 'package:skoolution/app/modules/verification_code/views/verification_code_view.dart';

class HomeController extends GetxController {
  // Navigation control
  final RxInt currentIndex = 0.obs;
  
  // Tab management
  void changeTab(int index) {
    currentIndex.value = index;
  
    if (index == 1) {
      Get.to(SignupView());
    } else if (index == 2) {
      Get.to(VerificationCodeView(contact: ""));
    }
  }

  // Optional: Clear controller when not needed
  @override
  void onClose() {
    // Dispose anything if needed
    super.onClose();
  }
}