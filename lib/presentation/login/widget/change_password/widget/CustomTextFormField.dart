// ignore_for_file: use_build_context_synchronously

import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';
import 'package:englishcoach/domain/Model/mod_user.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/login/desktop_login.dart';
import 'package:englishcoach/presentation/login/responsive_login/responsive_login.dart';
import 'package:englishcoach/presentation/login/widget/button/desktop_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.nameController,
    required this.passController,
    required this.newpassController,
  });

  final TextEditingController nameController;
  final TextEditingController passController;
  final TextEditingController newpassController;

  @override
  State<CustomTextFormField> createState() => _textformfieldState();
}

class _textformfieldState extends State<CustomTextFormField> {
  final GlobalKey<FormState> globalChangePasswordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: globalChangePasswordKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Change Password',
              style: AppStyles.bodyText,
            ),
            const SizedBox(height: 30),
            Center(
              child: TextArea(
                keyboardType: TextInputType.emailAddress,
                controller: widget.nameController,
                obscureText: false,
                name: 'Username',
                prefixIcon: const Icon(Icons.person),
                suffixIcon: const Icon(
                  Icons.abc,
                  color: AppColors.transColor,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter email';
                  } else {
                    return null;
                  }
                },
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
                      controller: widget.passController,
                      name: 'Password',
                      prefixIcon: const Icon(Icons.key),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isVisibile.value = !isVisibile.value;
                        },
                        child: isVisibile.value
                            ? const Icon(
                                Icons.visibility,
                                color: AppColors.actionColor1,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: AppColors.actionColor1,
                              ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter password';
                        } else if (value.length < 6) {
                          return "should be more than 6 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                  );
                }),
            const SizedBox(height: 10),
            ListenableBuilder(
                listenable: isVisibile,
                builder: (BuildContext context, value) {
                  return Center(
                    child: TextArea(
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      controller: widget.newpassController,
                      name: 'New Password',
                      prefixIcon: const Icon(Icons.key),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isVisibile.value = !isVisibile.value;
                        },
                        child: isVisibile.value
                            ? const Icon(
                                Icons.visibility,
                                color: AppColors.actionColor1,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: AppColors.actionColor1,
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
            ButtonDesktop(
              text: 'CHANGE',
              onpressed: () async {
                if (globalChangePasswordKey.currentState!.validate()) {
                  // Initialize User object with the provided data
                  User user = User(
                    userEmail: widget.nameController.text,
                    userPassword: widget.passController.text,
                    newPassword: widget.newpassController.text,
                  );

                  // Update the password using the UserproviderPassword
                  await Provider.of<UserproviderPassword>(context,
                          listen: false)
                      .updateData(user.userEmail, context, user.newPassword);

                  // Navigate to the DesktopViewLogin page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResponsiveLogin(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
