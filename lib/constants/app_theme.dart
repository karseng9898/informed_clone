import 'package:flutter/material.dart';

import 'colors.dart';

final AppTheme = ThemeData().copyWith(
  colorScheme: ThemeData().colorScheme.copyWith(
        background: const Color(0xFFFEFEFE),
      ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textTheme: TextTheme(
    titleLarge: Typography.blackHelsinki.titleLarge?.copyWith(
      color: Colors.black,
    ),
    headlineLarge: Typography.blackHelsinki.headlineLarge?.copyWith(
      color: AppColors.labelColor,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: Typography.blackHelsinki.headlineSmall?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.labelColor,
      height: 1.5,
    ),
    bodyLarge: Typography.blackHelsinki.bodyLarge,
    bodyMedium: Typography.blackHelsinki.bodyMedium,
  ),
);
