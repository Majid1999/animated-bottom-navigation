import 'package:get/get.dart';
import 'package:navigation/features/home/presentation/controller/home_controller.dart';


class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
