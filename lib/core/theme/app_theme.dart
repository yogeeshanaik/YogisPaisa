import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:paisa/core/constants/constants.dart';
import 'package:paisa/core/theme/paisa_theme.dart';

class AppTheme {
  // Dark Theme
  static ThemeData darkThemeData({
    required BuildContext context,
    required ColorScheme colorScheme,
    required Box<dynamic> value,
  }) {
    final String fontPreference =
        value.get(appFontChangerKey, defaultValue: 'Outfit');
    final darkTextTheme = GoogleFonts.getTextTheme(
      fontPreference,
      ThemeData.dark().textTheme,
    );
    return ThemeData.from(colorScheme: colorScheme).copyWith(
      textTheme: darkTextTheme,
      colorScheme: colorScheme,
      dialogTheme: dialogTheme,
      timePickerTheme: timePickerTheme,
      appBarTheme: appBarThemeLight(colorScheme),
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.background,
      navigationBarTheme: navigationBarThemeData(
        colorScheme,
        darkTextTheme,
      ),
      navigationDrawerTheme: navigationDrawerThemeData(
        colorScheme,
        darkTextTheme,
      ),
      drawerTheme: drawerThemeData(
        colorScheme,
        darkTextTheme,
      ),
      applyElevationOverlayColor: true,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: elevatedButtonTheme(
        context,
        colorScheme,
      ),
      extensions: [lightCustomColor],
      dividerTheme: DividerThemeData(
        color: ThemeData.light().dividerColor,
      ),
    );
  }

  // Light Theme
  static ThemeData lightThemeData({
    required BuildContext context,
    required ColorScheme colorScheme,
    required Box<dynamic> value,
  }) {
    final String fontPreference =
        value.get(appFontChangerKey, defaultValue: 'Outfit');
    final lightTextTheme = GoogleFonts.getTextTheme(
      fontPreference,
      ThemeData.light().textTheme,
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      textTheme: lightTextTheme,
      colorScheme: colorScheme,
      dialogTheme: dialogTheme,
      timePickerTheme: timePickerTheme,
      appBarTheme: appBarThemeLight(colorScheme),
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.background,
      navigationBarTheme: navigationBarThemeData(
        colorScheme,
        lightTextTheme,
      ),
      navigationDrawerTheme: navigationDrawerThemeData(
        colorScheme,
        lightTextTheme,
      ),
      drawerTheme: drawerThemeData(
        colorScheme,
        lightTextTheme,
      ),
      applyElevationOverlayColor: true,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: elevatedButtonTheme(
        context,
        colorScheme,
      ),
      extensions: [lightCustomColor],
      dividerTheme: DividerThemeData(
        color: ThemeData.light().dividerColor,
      ),
    );
  }
}
