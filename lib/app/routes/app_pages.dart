import 'package:get/get.dart';

import '../modules/Chat/bindings/chat_binding.dart';
import '../modules/Chat/views/chat_view.dart';
import '../modules/auth/binding/auth_binding.dart';
import '../modules/auth/view/auth_screen.dart';
import '../modules/auth/view/widgets/phone_binding.dart';
import '../modules/auth/view/widgets/phone_screen.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/blockAndReport/bindings/block_and_report_binding.dart';
import '../modules/blockAndReport/views/block_and_report_view.dart';
import '../modules/chatRoom/bindings/chat_room_binding.dart';
import '../modules/chatRoom/views/chat_room_view.dart';
import '../modules/favorites/bindings/favorites_binding.dart';
import '../modules/favorites/views/favorites_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/location/bindings/location_binding.dart';
import '../modules/location/views/location_view.dart';
import '../modules/my_ads/bindings/my_ads_binding.dart';
import '../modules/my_ads/views/my_ads_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/product_details_edit/bindings/product_details_edit_binding.dart';
import '../modules/product_details_edit/views/product_details_edit_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PHONE,
      page: () => const PhoneScreen(),
      binding: PhoneBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: _Paths.MY_ADS,
      page: () => const MyAdsView(),
      binding: MyAdsBinding(),
    ),
    GetPage(
      name: _Paths.Chat,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION,
      page: () => const LocationView(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS_EDIT,
      page: () => const ProductDetailsEditView(),
      binding: ProductDetailsEditBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => const ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BLOCK_AND_REPORT,
      page: () => const BlockAndReportView(),
      binding: BlockAndReportBinding(),
    ),
  ];
}
