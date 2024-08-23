import 'package:flutter/material.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/model/Contact.dart';

class BioDetail extends StatelessWidget {
  final ContactModel contact;
  const BioDetail({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextBio(title: contact.firstName),
        const SizedBox(
          height: 10,
        ),
        contact.phoneNumber != 0
            ? Column(
                children: [
                  TextBio(title: '+${contact.phoneNumber!}'),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            : const SizedBox(),
        TextBio(title: contact.email!),
        const SizedBox(
          height: 10,
        ),
        TextBio(title: contact.dob!),
      ],
    );
  }
}
