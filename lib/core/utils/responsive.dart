import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

class Responsive {
  late double width, height, inch;

  Responsive (BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    width = screenSize.width;
    height = screenSize.height;
    inch = math.sqrt(math.pow(width, 2) + math.pow(height, 2));
    ScreenUtil.init(context, designSize: Size(width, height));
  }

  double wp(double percent) => (width  * percent / 100);
  double hp(double percent) => (height * percent / 100);
  double ip(double percent) => (inch   * percent / 100);
  double sp(double fontSize) => ScreenUtil().setSp(fontSize);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1250 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1250;

  bool isPortrait(BuildContext context)   => MediaQuery.of(context).orientation == Orientation.portrait; 
  bool isLandscape(BuildContext context)  => MediaQuery.of(context).orientation == Orientation.landscape; 
      
}