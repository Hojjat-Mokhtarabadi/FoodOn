class Validator {
  String validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return "لطفا شماره همراه را وارد کنید.";
    if (phoneNumber.length != 11 ||
        (!phoneNumber.startsWith("09") && !phoneNumber.startsWith("۰۹")))
      return "شماره همراه نامعتبر است";
    return null;
  }

  String validateEmptyFields(String fieldInput) {
    if (fieldInput.isEmpty) return "لطفا این قسمت را پر کنید";
    return null;
  }

  String validatePassword(String password) {
    if (password.isEmpty) return "لطفا رمز عبور خود را وارد کنید";
    if (password.length < 5) return "رمز عبور ضعیف است";
    return null;
  }
}
