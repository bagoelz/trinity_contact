import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/component/snackbar.dart';
import 'package:trinity_contact/helper/SharedPref.dart';
import 'package:trinity_contact/shared/global.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get to => Get.find();
  TextEditingController credentials = TextEditingController();
  final formKeySign = GlobalKey<FormState>();
  final tryLogin = RxInt(0);
  final allowedLogin = RxBool(false);
  final store = SharedPref();

  handledLogin() {
    if (tryLogin.value >= 5) {
      return sendSnackbar(
          title: "Blocked", message: "Sorry, your account is blocked");
    }
    if (credentials.text == 'bagoelz') {
      store.save('AUTHORIZATION', 'true');
      return Get.offAllNamed('/home');
    } else {
      tryLogin.value++;
      tryLogin.refresh();
      return sendSnackbar(
          title: "Error",
          message: "Your credentials is incorrect, please try again");
    }
  }

  checkLogin() async {
    dynamic login = await store.read('AUTHORIZATION');
    if (login == 'true') {
      return Get.offAllNamed('/home');
    }
  }

  handledSignout() {
    store.remove('AUTHORIZATION');
    Get.offAllNamed('/signin');
  }

  allowed(val) {
    allowedLogin.value = true;
    allowedLogin.refresh();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    checkLogin();
    super.onReady();
  }
}
