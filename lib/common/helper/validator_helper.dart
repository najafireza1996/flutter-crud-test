

extension ValidatorHelper on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    final nameRegExp = RegExp(r'^[a-z A-Z]+$'); 
    return nameRegExp.hasMatch(this);
  }

  bool get isNotNull{
    return this!=null;
  }

  bool get isBankAccountNumber{
    final baNumber = RegExp(r'^\d{4}\-\d{4}\-\d{4}-\d{4}$');
    return baNumber.hasMatch(this);
  }

  bool get isValidPhone{
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isDateOfBirth{
    final dateOfBirth = RegExp(r'^20(((([248][048])|([13579][26]))\/(((0[13578]|1[02])\/([0-2][0-9]|3[01]))|((0[469]|11)\/([0-2][0-9]|30))|(02\/([0-2][0-9]))))|((([248][1-35-79])|([13579][013-57-9]))\/(((0[13578]|1[02])\/([0-2][0-9]|3[01]))|((0[469]|11)\/([0-2][0-9]|30))|(02\/(((0|1)[0-9])|(2[0-8]))))))$');
    return dateOfBirth.hasMatch(this);
  }
}