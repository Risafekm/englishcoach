// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, use_build_context_synchronously

import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';
import 'package:englishcoach/domain/Model/mod_user_authentication.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/dashboard/responsive_dash/responsive_dashboard.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/login/responsive_login/responsive_password.dart';
import 'package:englishcoach/presentation/login/widget/button/desktop_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 50),
          TextArea(
            keyboardType: TextInputType.text,
            name: 'User Name',
            controller: nameController,
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
              color: AppColors.accentColor1,
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
              color: AppColors.accentColor1,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResponsivePassword(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Text(
                    'Change Password?',
                    style: AppStyles.bodyText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ButtonDesktop(
            text: 'LOGIN',
            onpressed: () async {
              if (nameController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                // Show snackbar with error message if email or password is empty
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColors.actionColor2,
                    content: Text('Email and password cannot be empty'),
                  ),
                );
                return; // Exit the method early
              }

              // Proceed with authentication if email and password are not empty
              Auth user = Auth(
                userEmail: nameController.text,
                userPassword: passwordController.text,
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
                    builder: (context) => const ResponsiveDashBoard(),
                  ),
                );
              } else {
                // Show error message for incorrect credentials
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColors.actionColor2,
                    content: Text('Incorrect username or password'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
