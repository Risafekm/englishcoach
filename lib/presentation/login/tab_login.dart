// ignore_for_file: avoid_print

import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/dashboard/responsive_dash/responsive_dashboard.dart';
import 'package:englishcoach/presentation/login/widget/change_password/change_password_tablet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: Padding(
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
    );
  }
}

class TextFormFieldSection extends StatefulWidget {
  const TextFormFieldSection({super.key});

  @override
  State<TextFormFieldSection> createState() => _TextFormFieldSectionState();
}

TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
String errorMessage = '';

class _TextFormFieldSectionState extends State<TextFormFieldSection> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 50),
          TextArea(
            keyboardType: TextInputType.number,
            name: 'Username',
            controller: phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter number';
              } else {
                return null;
              }
            },
            suffixIcon: const Icon(
              Icons.abc,
              color: Colors.transparent,
            ),
            obscureText: false,
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          TextArea(
            keyboardType: TextInputType.number,
            name: 'Password',
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter password';
              } else {
                return null;
              }
            },
            suffixIcon: const Icon(
              Icons.abc,
              color: Colors.transparent,
            ),
            obscureText: false,
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Spacer(),
              InkWell(
                onDoubleTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TabChangePassword(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Text(
                    'Forgot password?',
                    style: GoogleFonts.acme(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResponsiveDashBoard()));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const Color.fromARGB(255, 32, 81, 127);
                  }
                  return const Color.fromARGB(255, 39, 130, 95);
                }),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Text(
                'LOG IN',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
