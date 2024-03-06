import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';
import 'package:englishcoach/presentation/login/widget/change_password/widget/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 184, 205, 221),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Container(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "englishcoach",
                        style: GoogleFonts.poppins(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Your Personal English Coach",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * .45,
                  width: MediaQuery.of(context).size.width * .35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(3, 3),
                          spreadRadius: 1,
                          blurRadius: 8,
                          color: Colors.grey.shade400),
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
