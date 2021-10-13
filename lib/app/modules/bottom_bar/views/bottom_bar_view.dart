import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/modules/bottom_bar/views/mine_view.dart';
import 'package:getx_app/app/modules/bottom_bar/views/project_view.dart';
import 'package:getx_app/app/modules/bottom_bar/views/task_view.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  final bottomBars = [ProjectView(), TaskView(), MineView()];

  @override
  Widget build(BuildContext context) {
    final Map? arguments = Get.arguments;
    // final parameters = Get.parameters;
    if (arguments != null &&
        arguments.isNotEmpty &&
        arguments['index'] != null) {
      controller.changeBottomBarIndex(arguments['index']);
    }
    return Scaffold(
        body: Obx(() => bottomBars[controller.bottomBarIndex.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.bottomBarIndex.value,
            onTap: (index) {
              controller.changeBottomBarIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                label: '项目',
                icon: Image.asset(
                  'assets/icons/project.png',
                  width: 19,
                  height: 19,
                ),
                activeIcon: Image.asset(
                  'assets/icons/project_active.png',
                  width: 19,
                  height: 19,
                ),
              ),
              BottomNavigationBarItem(
                label: '任务',
                icon: Image.asset(
                  'assets/icons/task.png',
                  width: 19,
                  height: 19,
                ),
                activeIcon: Image.asset(
                  'assets/icons/task_active.png',
                  width: 16.5,
                  height: 20,
                ),
              ),
              BottomNavigationBarItem(
                label: '我的',
                icon: Image.asset(
                  'assets/icons/mine.png',
                  width: 19,
                  height: 19,
                ),
                activeIcon: Image.asset(
                  'assets/icons/mine_active.png',
                  width: 17.5,
                  height: 17.5,
                ),
              ),
            ],
          ),
        ));
  }
}
