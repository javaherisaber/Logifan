extension BoolExtensions on bool? {
  bool get isNullOrFalse => this == null || this == false;

  bool get isNullOrTrue => this == null || this == true;

  bool get isNotNullAndFalse => this != null && this == false;

  bool get isNotNullAndTrue => this != null && this == true;
}
