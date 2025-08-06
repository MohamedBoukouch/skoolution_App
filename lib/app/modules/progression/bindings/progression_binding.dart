import 'package:get/get.dart';

import '../controllers/progression_controller.dart';

class ProgressionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgressionController>(
      () => ProgressionController(),
    );
  }
}
