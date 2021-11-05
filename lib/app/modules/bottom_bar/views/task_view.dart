import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/bottom_bar/controllers/task_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class TaskView extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('任务大厅'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
        backgroundColor: Color(0xFFFFD800),
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
