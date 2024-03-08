import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/login/responsive_login/responsive_login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const ResponsiveLogin(),
      backgroundColor: AppColors.accentColor1,
      splashIconSize: 400,
      duration: 2000,
      animationDuration: const Duration(seconds: 2),
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   "asset/images/logo.png",
          //   width: 170,
          //   height: 300,
          //   fit: BoxFit.cover,
          // ),
          Text(
            "englishcoach",
            style: AppStyles.splashText1,
          ),
          Text(
            "Your Personal English Coach",
            style: AppStyles.splashText2,
          ),
        ],
      ),
    );
  }
}
