import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/bottom_bar/controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
        backgroundColor: Color(0xFFFFD800),
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
