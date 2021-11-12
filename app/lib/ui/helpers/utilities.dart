import 'package:flutter/material.dart';

class UIUtilities {
  /// Get Size
  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Get Width
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get Height
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Create Sized Box
  static SizedBox createSizedBox({double? width, double? height}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
