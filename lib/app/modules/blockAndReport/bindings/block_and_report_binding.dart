import 'package:get/get.dart';

import '../controllers/block_and_report_controller.dart';

class BlockAndReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlockAndReportController>(
      () => BlockAndReportController(),
    );
  }
}
