import 'package:get/get.dart';

import 'package:getx_app/app/modules/bottom_bar/bindings/bottom_bar_binding.dart';
import 'package:getx_app/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:getx_app/app/modules/project_info/bindings/project_info_binding.dart';
import 'package:getx_app/app/modules/project_info/views/project_info_view.dart';
import 'package:getx_app/app/modules/task_info/bindings/task_info_binding.dart';
import 'package:getx_app/app/modules/task_info/views/task_info_view.dart';
import 'package:getx_app/app/modules/user_info/bindings/user_info_binding.dart';
import 'package:getx_app/app/modules/user_info/views/user_info_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_BAR;

  static final routes = [
    GetPage(
      name: _Paths.BOTTOM_BAR,
      page: () => BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_INFO,
      page: () => ProjectInfoView(),
      binding: ProjectInfoBinding(),
    ),
    GetPage(
      name: _Paths.TASK_INFO,
      page: () => TaskInfoView(),
      binding: TaskInfoBinding(),
    ),
    GetPage(
      name: _Paths.USER_INFO,
      page: () => UserInfoView(),
      binding: UserInfoBinding(),
    ),
  ];
}
