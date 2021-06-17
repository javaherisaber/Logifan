extension StringExtensions on String {

  bool isValidMobileOrEmail() {
    if (this.contains('@')) {
      return this.isValidEmail();
    } else {
      return this.isValidMobile();
    }
  }

  bool isValidMobile() {
    final regex = RegExp(r'^\+?[0-9]+$'); // accepts both +989... and 09...
    return regex.hasMatch(this);
  }

  bool isValidEmail() {
    final regex = RegExp(r'^.+@.+(\..+)+$'); // keeping it simple for brevity
    return regex.hasMatch(this);
  }
}
