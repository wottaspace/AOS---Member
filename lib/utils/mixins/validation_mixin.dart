mixin ValidationMixin {
  String? validateRequired({required String fieldName, required String? value}) {
    final String validationMessage = "The $fieldName field is required";
    if (value == null) return validationMessage;
    if (value.isEmpty) return validationMessage;
    return null;
  }

  String? validateEmail({required String fieldName, required String email}) {
    final String validationMessage = "The $fieldName is not a correct email";
    final RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(email)) return validationMessage;
    return null;
  }
}
