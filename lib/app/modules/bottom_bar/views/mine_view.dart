import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/modules/bottom_bar/controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MineView'),
        centerTitle: true,
      ),
      body: Center(
          child: Obx(() => Column(
                children: [
                  Text('count 值为 ${controller.count.value}'),
                  ElevatedButton(
                      onPressed: () {
                        controller.increment();
                      },
                      child: Text('点击+1'))
                ],
              ))),
    );
  }
}
