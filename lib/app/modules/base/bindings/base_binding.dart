import 'package:ez_build/app/modules/add_item/controllers/add_item_controller.dart';
import 'package:get/get.dart';
import '../../Chat/controllers/chat_controller.dart';
import '../../favorites/controllers/favorites_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<AddItemController>(() => AddItemController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
