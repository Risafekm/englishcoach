// ignore_for_file: avoid_print

import 'package:englishcoach/presentation/login/widget/button/custom_provider.dart';
import 'package:flutter/material.dart';

class TabViewLogin extends StatefulWidget {
  const TabViewLogin({super.key});

  @override
  State<TabViewLogin> createState() => _TabViewLoginState();
}

class _TabViewLoginState extends State<TabViewLogin> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 184, 205, 221),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 184, 205, 221),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  "assets/splashicon.png",
                  scale: 1.8,
                  // fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 25,
                ),

                const CustomProvider(), // Ensure this is directly under here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
