import 'package:englishcoach/presentation/login/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RootScreen());
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
