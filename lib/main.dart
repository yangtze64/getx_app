import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await initApp();
  runApp(MainApp());
}

Future<void> initApp() async {
  print('starting services ...');
  // await Get.putAsync(() => GlobalConfigService().init());
  // // await Get.putAsync(SettingsService()).init();
  print('All services started...');
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "蜜蜂实习",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        enableLog: true,
        theme: ThemeData(),
      ),
    );
  }
}
