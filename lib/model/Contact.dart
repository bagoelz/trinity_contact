class ContactModel {
  late String id, firstName, lastName;
  String? dob, email;
  int? phoneNumber;

  ContactModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.email,
      this.dob,
      this.phoneNumber});

  ContactModel.map(dynamic data) {
    id = data['id'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    dob = data['dob'] ?? '';
    phoneNumber = data['phoneNumber'] ?? 0;
  }
}
