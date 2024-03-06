// ignore_for_file: avoid_print

import 'package:englishcoach/application/provider/user_provider_password_update.dart';
import 'package:englishcoach/presentation/login/widget/button/FormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
                const TextFormFieldSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldSection extends StatefulWidget {
  const TextFormFieldSection({super.key});

  @override
  State<TextFormFieldSection> createState() => _TextFormFieldSectionState();
}

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
String errorMessage = '';

class _TextFormFieldSectionState extends State<TextFormFieldSection> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserproviderPassword>(
      create: (context) => UserproviderPassword(),
      builder: (context, child) {
        return LoginForm();
      },
    );
  }
}
