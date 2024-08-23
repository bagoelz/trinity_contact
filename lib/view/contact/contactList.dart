import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/controller/Contact.dart';
import 'package:trinity_contact/model/Contact.dart';
import 'package:trinity_contact/shared/constant.dart';

class ContactList extends GetView<ContactController> {
  final List<ContactModel> contacts;
  const ContactList({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(contacts.length, (urutan) {
          ContactModel contact = contacts[urutan];
          String? addText;
          if (contact.id == controller.ownContact.value?.id) {
            addText = "(you)";
          }
          String? avatarText = controller.getFirstCapital(contact);

          return InkWell(
            onTap: () {
              controller.selectContact(contact);
              Get.toNamed('/contactdetail');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AvatarWidget(
                addedText: addText,
                avatarText: avatarText,
                fullname: controller.getFullName(contact),
              ),
            ),
          );
        }));
  }
}

class AvatarWidget extends StatelessWidget {
  final String avatarText;
  final String fullname;
  final String? addedText;
  const AvatarWidget(
      {super.key,
      required this.fullname,
      required this.avatarText,
      this.addedText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 10,
        ),
        AvatarCircle(avatarText: avatarText),
        const SizedBox(
          width: 10,
        ),
        TextBio(title: fullname),
        const SizedBox(
          width: 10,
        ),
        addedText != null
            ? TextBio(title: addedText!, color: CustomizeTheme.lightGrayColor)
            : const SizedBox()
      ],
    );
  }
}
