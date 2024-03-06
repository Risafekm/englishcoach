// ignore_for_file: use_key_in_widget_constructors

import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';
import 'package:englishcoach/presentation/login/widget/change_password/widget/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabChangePassword extends StatefulWidget {
  const TabChangePassword({Key? key});

  @override
  State<TabChangePassword> createState() => _TabChangePasswordState();
}

class _TabChangePasswordState extends State<TabChangePassword> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  GlobalKey<FormState> desktopFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 184, 205, 221),
      child: Scaffold(
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
                  height: 50,
                ),
                ChangeNotifierProvider<UserproviderPassword>(
                  create: (context) => UserproviderPassword(),
                  builder: (context, child) {
                    return CustomTextFormField(
                        // desktopFormKey: desktopFormKey,
                        nameController: nameController,
                        passController: passController,
                        newpassController: newpassController);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
