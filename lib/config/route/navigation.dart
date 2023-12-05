import 'package:get/get.dart';
import 'package:navigation/config/route/routes.dart';
import 'package:navigation/features/home/presentation/controller/bindings/home_controller_binding.dart';
import 'package:navigation/features/home/presentation/views/home_screen.dart';

class Navigation {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
  ];
}