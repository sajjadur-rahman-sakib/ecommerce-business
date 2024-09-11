import 'package:ecommerce/presentation/ui/screens/splash_screen.dart';
import 'package:ecommerce/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Colors.white,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.themeColor,
        ),
      ),
    );
  }
}
