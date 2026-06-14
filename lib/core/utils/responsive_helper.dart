import 'package:flutter/widgets.dart';

abstract final class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600;
  }

  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width < 600 ? 24 : 48;
  }
}
