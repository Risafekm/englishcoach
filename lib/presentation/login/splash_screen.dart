import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:englishcoach/presentation/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const LoginScreen(),
      backgroundColor: Color.fromARGB(255, 1, 76, 82),
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
            style: GoogleFonts.poppins(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Your Personal English Coach",
            style: GoogleFonts.poppins(
                fontSize: 11, color: Colors.white, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
