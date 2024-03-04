// ignore_for_file: avoid_print

import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';
import 'package:englishcoach/domain/Model/mod_user_authentication.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/login/desktop_login.dart';
import 'package:englishcoach/presentation/login/mobile_login.dart';
import 'package:englishcoach/presentation/login/widget/button/desktop_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MobileChangePassword extends StatefulWidget {
  const MobileChangePassword({super.key});

  @override
  State<MobileChangePassword> createState() => _MobileChangePassword();
}

class _MobileChangePassword extends State<MobileChangePassword> {
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

TextEditingController nameController = TextEditingController();

TextEditingController passController = TextEditingController();

TextEditingController newpassController = TextEditingController();

final formkey = GlobalKey<FormState>();

class _TextFormFieldSectionState extends State<TextFormFieldSection> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 50),
          TextArea(
            keyboardType: TextInputType.text,
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
          const SizedBox(height: 10),
          ListenableBuilder(
              listenable: isVisibile,
              builder: (BuildContext context, value) {
                return Center(
                  child: TextArea(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    controller: newpassController,
                    name: 'New Password',
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isVisibile.value = !isVisibile.value;
                      },
                      child: isVisibile.value
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter new password';
                      } else if (value.length < 6) {
                        return "should be more than 6 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                );
              }),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
            child: ButtonDesktop(
              text: 'Login',
              onpressed: () async {
                // Create an Auth object with user input
                Auth user = Auth(
                  userEmail: nameController.text,
                  userPassword: passController.text,
                );

                // Call the addData method to authenticate the user
                await Provider.of<UserproviderPassword>(
                  context,
                  listen: false,
                ).addData(user.userEmail, user.userPassword, context);

                // Check if authentication was successful
                if (Provider.of<UserproviderPassword>(
                  context,
                  listen: false,
                ).isAuthenticated) {
                  // Navigate to the Dashboard page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MobileViewLogin(),
                    ),
                  );
                } else {
                  // Show error message for incorrect credentials
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incorrect username or password'),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
