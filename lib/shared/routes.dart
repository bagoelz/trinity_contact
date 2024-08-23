import 'package:get/route_manager.dart';
import 'package:trinity_contact/view/view.dart';

class AppRoutes {
  AppRoutes._();
  static final Routes = [
    GetPage(
      name: '/signin',
      page: () => const SignInPage(),
    ),
    GetPage(
      name: '/contact',
      page: () => const ContactPage(),
    ),
  ];
}
