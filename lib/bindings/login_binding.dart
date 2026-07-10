import 'package:get/get.dart';
import 'package:society_app/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );
  }

}