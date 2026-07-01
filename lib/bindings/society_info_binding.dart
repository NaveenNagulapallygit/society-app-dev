import 'package:get/get.dart';
import '../controllers/society_info_controller.dart';

class SocietyInfoBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<SocietyInfoController>(
          () => SocietyInfoController(),
    );

  }
}