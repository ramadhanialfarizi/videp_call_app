import 'package:flutter/material.dart';

class Constant {
  static double getFullHeight(context) {
    double screenFullHeight = MediaQuery.of(context).size.height;

    return screenFullHeight;
  }

  static double getFullWidth(context) {
    double screenFullHeight = MediaQuery.of(context).size.width;

    return screenFullHeight;
  }

  // static double textScalling(context) {
  //   double textScale = MediaQuery.of(context).textScaler.
  // }
}
