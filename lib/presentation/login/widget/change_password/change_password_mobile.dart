// ignore_for_file: use_key_in_widget_constructors

import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/login/widget/change_password/widget/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileChangePassword extends StatefulWidget {
  const MobileChangePassword({Key? key});

  @override
  State<MobileChangePassword> createState() => _MobileChangePasswordState();
}

class _MobileChangePasswordState extends State<MobileChangePassword> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  GlobalKey<FormState> desktopFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.secondaryColor,
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
                  style: AppStyles.loginText1,
                ),
                Text(
                  "Your Personal English Coach",
                  style: AppStyles.loginText2,
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
