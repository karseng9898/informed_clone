import 'package:flutter/material.dart';

import 'constants/app_theme.dart';
import 'modules/modules.dart';
import 'widgets/keyboard_dismissal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissal(
      child: MaterialApp(
        title: 'Informed',
        theme: AppTheme.lightTheme,
        home: const OnboardingScreen(),
      ),
    );
  }
}
