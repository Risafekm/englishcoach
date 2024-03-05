// ignore_for_file: avoid_print
import 'package:englishcoach/presentation/login/widget/button/FormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileViewLogin extends StatefulWidget {
  const MobileViewLogin({super.key});

  @override
  State<MobileViewLogin> createState() => _MobileViewLoginState();
}

class _MobileViewLoginState extends State<MobileViewLogin> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 184, 205, 221),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 184, 205, 221),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Text(
                  "englishcoach",
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Your Personal English Coach",
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 60,
                ),
                const MobileTextFormFieldSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileTextFormFieldSection extends StatefulWidget {
  const MobileTextFormFieldSection({super.key});

  @override
  State<MobileTextFormFieldSection> createState() =>
      _TextFormFieldSectionState();
}

class _TextFormFieldSectionState extends State<MobileTextFormFieldSection> {
  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
}
