import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Size get screenSize => MediaQuery.sizeOf(this);
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;
}
