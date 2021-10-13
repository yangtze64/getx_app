import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/task_info_controller.dart';

class TaskInfoView extends GetView<TaskInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaskInfoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TaskInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
