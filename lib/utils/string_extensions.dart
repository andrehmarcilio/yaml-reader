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
}
