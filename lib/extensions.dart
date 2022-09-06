import 'package:flutter/material.dart';
import 'package:pwa_demo/app_provider.dart';

extension BuildContextExt on BuildContext {
  bool get isLargeScreen {
    Size size = MediaQuery.of(this).size;
    double width = size.width > size.height ? size.height : size.width;

    return width > 600;
  }

  // Accounts for extremely large screens
  bool get isExpanded{
     Size size = MediaQuery.of(this).size;
    double width = size.width > size.height ? size.height : size.width;

    return width > 1200;
  }

  AppProvider get provider => AppProvider.of(this);
}
