import 'package:flutter/material.dart';

class Responsive {
  bool get isPortrait => orientation == Orientation.portrait;

  factory Responsive() {
    if (_instance == null) {
      init();
    }
    return _instance!;
  }
  static Responsive? _instance;

  double _screenWidth = 0;
  double _screenHeight = 0;

  Responsive._();
  static void init() {
    _instance ??= Responsive._();
  }

  static double w = 0;
  static double h = 0;
  static double _minDimension = 0;
  static Orientation? orientation;

  recalculate(BuildContext context) {
    final _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _instance ??= Responsive._();
    w = _screenWidth / 100;
    h = _screenHeight / 100;
    if (_screenWidth < _screenHeight) {
      orientation = Orientation.portrait;
      _minDimension = _screenWidth / 100.0;
    } else {
      orientation = Orientation.landscape;
      _minDimension = _screenHeight / 100.0;
    }
  }
}

bool get isTablet => 100.wp > 600;

bool get isPhone => 100.wp < 600;

extension ScreenPercentage on num {
  double get hp => this * Responsive.h;
  double get wp => this * Responsive.w;
  double get mh {
    return (this * 1.82) * Responsive.h;
  }

  double get mhw {
    return (this * 1.82) * Responsive.h;
  }
}
