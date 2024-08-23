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
      name: '/home',
      page: () => const HomePage(),
    ),
    GetPage(
      name: '/contact',
      page: () => const ContactPage(),
    ),
    GetPage(
      name: '/contactdetail',
      page: () => const ContactDetailPage(),
    ),
    GetPage(
      name: '/addcontact',
      page: () => const AddContactPage(),
    ),
  ];
}
