import 'dart:math';

class SizeService {
  static const double maxWidth = 1260;

  static double leftRightPadding(double screenWidth,
      {double maxWidth = maxWidth}) {
    return max((screenWidth - maxWidth) / 2, 15);
  }
}
