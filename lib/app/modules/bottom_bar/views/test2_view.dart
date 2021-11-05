import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class Test2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
        backgroundColor: Color(0xFFFFD800),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: 100,
              color: Colors.red,
              child: Text('100'),
            ),
            Container(
              width: 1.sw,
              height: 200,
              child: Stack(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('按钮')),
                  Positioned.fill(
                    top: 100,
                    child: Container(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 40.h,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: Text(
                                    '测试',
                                    style: TextStyle(
                                      color: Color(0xFFFA5533),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.check,
                                  color: Color(0xFFFA5533),
                                  size: 16.w,
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(height: .8),
                        itemCount: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 1.sw,
              height: 80,
              color: Colors.yellow,
              child: Text('80'),
            ),
          ],
        ),
      ),
    );
  }
}
