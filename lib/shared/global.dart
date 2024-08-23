import 'package:get/get.dart';
import 'package:trinity_contact/controller/Contact.dart';
import 'package:trinity_contact/controller/Home.dart';

import '../controller/Controller.dart';

class Global {
  static Future<void> init() async {
    Get.put<AuthenticationController>(AuthenticationController());
    Get.put<HomeController>(HomeController());
    Get.lazyPut(() => ContactController());
  }
}
