extension StringExtensions on String {
  bool isInsignificant() {
    return trim().isEmpty || trim().startsWith('#');
  }

  int getLeftSpace() {
    int currentLevel = 0;

    for (int i = 0; i < length; i++) {
      if (this[i].trim().isEmpty) {
        currentLevel++;
      } else {
        break;
      }
    }
    return currentLevel;
  }

  dynamic tryParseToSomething() {
    int? someIntValue = int.tryParse(this);
    if (someIntValue != null) {
      return someIntValue;
    }
    double? someDoubleValue = double.tryParse(this);
    if (someDoubleValue != null) {
      return someDoubleValue;
    }

    if (this == 'true') {
      return true;
    } else if (this == 'false') {
      return false;
    }

    return this;
  }
}
