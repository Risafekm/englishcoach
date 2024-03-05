import 'package:englishcoach/application/provider/user_provider_password_update.dart';
import 'package:englishcoach/domain/model/mod_user.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/login/desktop_login.dart';
import 'package:englishcoach/presentation/login/widget/button/desktop_button.dart';
import 'package:englishcoach/presentation/login/widget/change_password/widget/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

ValueNotifier<bool> isVisibile = ValueNotifier<bool>(true);

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController newpassController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:

            //login area

            Expanded(
          flex: 1,
          child: SingleChildScrollView(
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
                  // const SizedBox(height: 10),
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
                      child: SingleChildScrollView(
                        child: Form(
                          key: formkey,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                'Change Password',
                                style: GoogleFonts.lora(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              const SizedBox(height: 30),
                              Center(
                                child: TextArea(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: nameController,
                                  obscureText: false,
                                  name: 'Username',
                                  prefixIcon: const Icon(Icons.person),
                                  suffixIcon: const Icon(
                                    Icons.abc,
                                    color: Colors.transparent,
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
                                        controller: passController,
                                        name: 'Password',
                                        prefixIcon: const Icon(Icons.key),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            isVisibile.value =
                                                !isVisibile.value;
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
                                        controller: newpassController,
                                        name: 'New Password',
                                        prefixIcon: const Icon(Icons.key),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            isVisibile.value =
                                                !isVisibile.value;
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
                              ButtonDesktop(
                                text: 'Change Password',
                                onpressed: () async {
                                  // Initialize User object with the provided data
                                  User user = User(
                                    userEmail: nameController.text,
                                    userPassword: passController.text,
                                    newPassword: newpassController.text,
                                  );

                                  // Update the password using the UserproviderPassword
                                  await Provider.of<UserproviderPassword>(
                                      context,
                                      listen: false)
                                    ..updateData(user.userEmail, context,
                                        user.newPassword);

                                  // Navigate to the MobileViewLogin page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DesktopViewLogin(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
