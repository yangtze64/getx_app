import 'package:get/get.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class BottomBarController extends GetxController {
  final bottomBarIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void changeBottomBarIndex(int index) {
    bottomBarIndex.value = index;
  }

  void switchChangeBottomBar(int index) async {
    changeBottomBarIndex(index);
    await Get.toNamed(Routes.BOTTOM_BAR);
  }
}
