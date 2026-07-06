import 'package:get/get.dart';
import 'package:society_app/controllers/approval_pending_controller.dart';

class ApprovalPendingBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
            () => ApprovalPendingController(),
    );
  }

}