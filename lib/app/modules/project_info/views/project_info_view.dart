import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/modules/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:getx_app/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:getx_app/app/modules/bottom_bar/views/mine_view.dart';
import 'package:getx_app/app/routes/app_pages.dart';

import '../controllers/project_info_controller.dart';

class ProjectInfoView extends GetView<ProjectInfoController> {
  final bottomBarController = Get.find<BottomBarController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProjectInfoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'ProjectInfoView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.BOTTOM_BAR, arguments: {"index": 2});
                  // bottomBarController.switchChangeBottomBar(2);
                },
                child: Text('去我的tab')),
          ],
        ),
      ),
    );
  }
}
