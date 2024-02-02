import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/core/style/colors.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColor.scaffoldBackground,
    splashColor: AppColor.secondaryColor,
    highlightColor: AppColor.accentColor,
    primaryColor: AppColor.scaffoldBackground,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColor.scaffoldBackground, brightness: Brightness.dark),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColor.scaffoldBackground,
      iconTheme: IconThemeData(
        color: AppColor.secondaryColor,
      ),
      titleTextStyle: TextStyle(
        color: AppColor.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        color: AppColor.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.scaffoldBackground,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: AppColor.accentColor,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor.accentColor,
      unselectedLabelColor: AppColor.secondaryText,
    ),
  );
}
