import 'package:get/get.dart';
import 'package:getx_app/app/modules/bottom_bar/controllers/mine_controller.dart';
import 'package:getx_app/app/modules/bottom_bar/controllers/project_controller.dart';
import 'package:getx_app/app/modules/bottom_bar/controllers/task_controller.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(() {
      print("BottomBarController");
      return BottomBarController();
    });

    Get.lazyPut<ProjectController>(() {
      print("ProjectController");
      return ProjectController();
    });

    Get.lazyPut<TaskController>(() {
      print("TaskController");
      return TaskController();
    });

    Get.lazyPut<MineController>(() {
      print("MineController");
      return MineController();
    });
  }
}
