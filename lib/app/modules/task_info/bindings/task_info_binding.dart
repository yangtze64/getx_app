import 'package:get/get.dart';

import '../controllers/task_info_controller.dart';

class TaskInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskInfoController>(
      () => TaskInfoController(),
    );
  }
}
