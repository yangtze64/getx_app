import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/modules/bottom_bar/controllers/project_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class ProjectView extends GetView<ProjectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProjectView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'ProjectView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.PROJECT_INFO);
                },
                child: Text('进入project_info详情页')),
          ],
        ),
      ),
    );
  }
}
