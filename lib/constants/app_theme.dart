import 'package:flutter/material.dart';

import 'colors.dart';
import 'spacings.dart';

class AppTheme {
  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacings.xl,
        vertical: AppSpacings.lg,
      ),
      backgroundColor: const Color(0xFF333333),
      disabledBackgroundColor: const Color(0xFF777777),
      foregroundColor: Colors.white,
    ),
  );
  static final lightTheme = ThemeData(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: _lightTextTheme,
    textButtonTheme: textButtonTheme,
  );

  static final _colorScheme = ThemeData().colorScheme.copyWith(
        background: const Color(0xFFFEFEFE),
      );

  static final _lightTextTheme = TextTheme(
    titleLarge: Typography.blackHelsinki.titleLarge,
    headlineLarge: Typography.blackHelsinki.headlineLarge
        ?.copyWith(color: AppColors.labelColor),
    headlineSmall: Typography.blackHelsinki.headlineSmall?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.labelColor,
      height: 1.5,
    ),
    bodyLarge: Typography.blackHelsinki.bodyLarge,
    bodyMedium: Typography.blackHelsinki.bodyMedium,
  );
}

extension _LightTheme on AppTheme {}
