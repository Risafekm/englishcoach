// ignore_for_file: avoid_print

import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/dashboard/responsive_dash/responsive_dashboard.dart';
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
      color: AppColors.secondaryColor,
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
                style:AppStyles.loginText1,
              ),
              Text(
                "Your Personal English Coach",
                style: AppStyles.loginText2,
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
              color: AppColors.transColor,
            ),
            obscureText: false,
            prefixIcon: const Icon(
              Icons.person,
              color: AppColors.actionColor1,
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
              color: AppColors.transColor,
            ),
            obscureText: false,
            prefixIcon: const Icon(
              Icons.lock,
              color: AppColors.actionColor2,
            ),
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
                    return AppColors.accentColor1;
                  }
                  return AppColors.accentColor2;
                }),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Text(
                'LOG IN',
                style: AppStyles.buttonText
              ),
            ),
          ),
        ],
      ),
    );
  }
}
