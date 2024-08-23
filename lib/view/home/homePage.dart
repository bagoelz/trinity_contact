import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/controller/Home.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/view/view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: controller.selectedMenu.value == 0
            ? const ContactPage()
            : const ProfilePage(),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: CustomizeTheme.blueColor,
          tooltip: 'Add Contact',
          onPressed: () => Get.toNamed('/addcontact'),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).canvasColor,
          selectedFontSize: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '',
              icon: InkWell(
                  onTap: () => controller.changeMenu(0),
                  child: controller.selectedMenu.value == 0
                      ? CustomizeTheme.iconHomeSelect
                      : CustomizeTheme.iconHome),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: InkWell(
                  onTap: () => controller.changeMenu(1),
                  child: Icon(
                    Icons.person_outlined,
                    size: 30,
                    color: controller.selectedMenu.value == 1
                        ? CustomizeTheme.blueColor
                        : CustomizeTheme.darkGrayColor,
                  )),
            ),
          ],
        ),
      );
    });
  }
}
