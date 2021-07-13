import 'package:flutter/material.dart';

class Px {

  static double _width = 0.0;
  static double _height = 0.0;


  static double getWidth() => _width;

  static double getHeight() => _height;

  static double matchWidth(context) {
    _width = MediaQuery
        .of(context)
        .size
        .width;
    return _width;
  }

  static double matchHeight(context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;
    return _height;
  }



}