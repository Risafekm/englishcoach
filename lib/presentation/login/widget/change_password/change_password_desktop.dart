import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/login/widget/change_password/widget/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ValueNotifier<bool> isVisibile = ValueNotifier<bool>(true);

class DesktopChangePassword extends StatefulWidget {
  DesktopChangePassword({Key? key});

  @override
  State<DesktopChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<DesktopChangePassword> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  GlobalKey<FormState> desktopFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: AppColors.secondaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * .45,
                  width: MediaQuery.of(context).size.width * .35,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(3, 3),
                          spreadRadius: 1,
                          blurRadius: 8,
                          color: AppColors.shadowColor),
                    ],
                  ),
                  child: ChangeNotifierProvider<UserproviderPassword>(
                    create: (context) => UserproviderPassword(),
                    builder: (context, child) {
                      return CustomTextFormField(
                          // desktopFormKey: desktopFormKey,
                          nameController: nameController,
                          passController: passController,
                          newpassController: newpassController);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
