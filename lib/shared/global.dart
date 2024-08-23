import 'package:get/get.dart';
import 'package:trinity_contact/controller/Contact.dart';

import '../controller/Controller.dart';

class Global {
  static Future<void> init() async {
    Get.put<AuthenticationController>(AuthenticationController());
    Get.lazyPut(() => ContactController());
  }
}
