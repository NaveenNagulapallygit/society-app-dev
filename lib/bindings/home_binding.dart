import 'package:get/get.dart';
import 'package:society_app/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }

}