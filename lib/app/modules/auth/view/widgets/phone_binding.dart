import 'package:ez_build/app/modules/auth/view/widgets/phone_controller.dart';
import 'package:get/get.dart';

class PhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneController>(
      () => PhoneController(),
    );
  }
}
