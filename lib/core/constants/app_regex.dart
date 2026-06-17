abstract final class AppRegex {
  static final RegExp emailRegex = RegExp(
    r'^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
  );

  static final RegExp strongPasswordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%&*!])\S{8,}$',
  );

  static final RegExp hasUppercase = RegExp(r'[A-Z]');
  static final RegExp hasLowercase = RegExp(r'[a-z]');
  static final RegExp hasNumber = RegExp(r'\d');
  static final RegExp hasSpecialCharacter = RegExp(r'[@#$%&*!]');
  static final RegExp hasArabic = RegExp(r'[\u0600-\u06FF]');
  static final RegExp hasWhitespace = RegExp(r'\s');
  static final RegExp emailAllowedCharacters = RegExp(r'[A-Za-z0-9._@-]');
  static final RegExp passwordAllowedCharacters = RegExp(r'[!-~]');
}
