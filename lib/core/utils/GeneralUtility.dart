// ignore_for_file: file_names

import 'dart:math';

class GeneralUtility {
  randomIdCode(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }
}
