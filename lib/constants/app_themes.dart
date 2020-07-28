import 'package:flutter/material.dart';
import 'package:skype_clone/constants/app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? kBlackColor : kWhiteColor,
      backgroundColor: isDarkTheme ? kBlackColor : kWhiteColor,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xff4285F4),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xff4285F4),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xff4285F4),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xff4285F4),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Color(0xff3A3A3B),
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
