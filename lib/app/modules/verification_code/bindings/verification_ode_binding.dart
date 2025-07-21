import 'package:get/get.dart';

import '../controllers/verification_ode_controller.dart';

class VerificationOdeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationOdeController>(
      () => VerificationOdeController(),
    );
  }
}
