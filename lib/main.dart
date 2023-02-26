import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'modules/modules.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informed',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              background: const Color(0xFFFEFEFE),
            ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: _getTextTheme(),
      ),
      home: const OnboardingScreen(),
    );
  }

  TextTheme _getTextTheme() {
    return TextTheme(
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
}
