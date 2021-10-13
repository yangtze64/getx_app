import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/modules/bottom_bar/controllers/task_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class TaskView extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaskView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'TaskView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.TASK_INFO);
                },
                child: Text('进入task_info详情页'))
          ],
        ),
      ),
    );
  }
}
