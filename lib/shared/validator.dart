class Validator {
  String? validateNumber(String? value) {
    if (value!.isEmpty) return 'required ';
    final RegExp nameExp = new RegExp(r'^[0-9-]+$');
    if (!nameExp.hasMatch(value)) return 'Only numbers allowed';
    return null;
  }

  String? validateText(String? value) {
    if (value!.isEmpty) return 'required';
    final RegExp nameExp = RegExp(r"""^[\-A-za-z0-9,.:|()@/'?'" ]+$""");
    if (!nameExp.hasMatch(value)) return 'Only Alphabet allowed';
    return null;
  }

  String? validateTextEmpty(String? value) {
    if (value!.isNotEmpty) {
      final RegExp nameExp = RegExp(r'^[\-A-za-z0-9,.|()@ ]+$');
      if (!nameExp.hasMatch(value)) {
        return 'Hanya huruf Alphabet yang di izinkan';
      }
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) return 'Email is required.';
    final RegExp nameExp = RegExp(r'[^\s@]+@[^\s@]+\.[^\s@]+');
    if (!nameExp.hasMatch(value)) return 'Invalid email address';
    return null;
  }
}
