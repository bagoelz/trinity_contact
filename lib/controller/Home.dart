import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final selectedMenu = RxInt(0);

  changeMenu(int val) {
    selectedMenu.value = val;
    update();
  }
}
