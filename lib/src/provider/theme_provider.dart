import 'package:cobra_vault/src/helpers/app_color.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  set setThemeMode(mode) {
    themeMode = mode;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    scaffoldBackgroundColor: AppColors.DARK_BACKGROUND_COLOR,
    colorScheme: const ColorScheme.dark(),
    primaryColor: const Color(0xFFFFFFFF),
    cardColor: const Color(0xFF363636),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF363636),
      selectedItemColor: Color(0xFF007DFF),
      unselectedItemColor: Color(0xFF777777),
      selectedIconTheme: IconThemeData(
        size: 25,
      ),
      unselectedIconTheme: IconThemeData(size: 25),
    ),
    backgroundColor: Color(0xFF6D6D6D),
    iconTheme: const IconThemeData(color: Color(0xFFF5F5F5), size: 25),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        color: Color(0xFFF5F5F5),
        fontSize: 22,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      ),
      headline3: TextStyle(
        color: Color(0xFFF5F5F5),
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        color: Color(0xFF898989),
        fontFamily: 'Roboto',
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        color: Color(0xFF898989),
        fontFamily: 'Roboto',
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        color: Color(0xFF777777),
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        color: Color(0xFFEFEFEF),
        fontFamily: 'Roboto',
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF898989),
        fontFamily: 'Roboto',
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.LIGHT_BACKGROUND_COLOR,
    colorScheme: ColorScheme.light(),
    primaryColor: Color(0xFF2E2E2E),
    cardColor: Color(0xFFFFFFFF),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: Color(0xFF007DFF),
      unselectedItemColor: AppColors.FULL_DARK,
      selectedIconTheme: IconThemeData(
        size: 25,
      ),
      unselectedIconTheme: IconThemeData(size: 25),
    ),
    backgroundColor: Color(0xFFBCBCBC),
    iconTheme: const IconThemeData(color: AppColors.FULL_DARK, size: 25),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.FULL_DARK,
        fontSize: 28,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        color: AppColors.FULL_DARK,
        fontSize: 22,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      ),
      headline3: TextStyle(
        color: AppColors.FULL_DARK,
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        color: Color(0xFF2E2E2E),
        fontFamily: 'Roboto',
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        color: Color(0xFF1A1A1A),
        fontFamily: 'Roboto',
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF777777),
        fontFamily: 'Roboto',
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        color: Color(0xFF1A1A1A),
        fontFamily: 'Roboto',
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        color: Color(0xFF4E4D4D),
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
