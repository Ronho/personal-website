import 'dart:math';

class SizeService {
  static const double maxWidth = 1260;
  static const double minPadding = 15;
  static const double smallNavBar = 800;

  static double leftRightPadding(double screenWidth,
      {double maxWidth = maxWidth, double minPadding = minPadding}) {
    return max((screenWidth - maxWidth) / 2, minPadding);
  }

  static double middleSize(double screenWidth, double padding, double minWidth,
      {double maxWidth = maxWidth}) {
    if (screenWidth > (maxWidth + 2*padding)) {
      return maxWidth;
    } else {
      return max((screenWidth - 2*padding), minWidth);
    }
  }
}
