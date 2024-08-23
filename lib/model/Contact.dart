class ContactModel {
  late String id, firstName, lastName;
  String? dob, email;

  ContactModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.dob,
  });

  ContactModel.map(dynamic data) {
    id = data['id'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    dob = data['dob'] ?? '';
  }
}

class CollectContact {
  String? firstCapital;
  List<ContactModel>? contacts = [];

  CollectContact({this.firstCapital, this.contacts});
}
