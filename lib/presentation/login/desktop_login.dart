// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/dashboard/responsive_dash/responsive_dashboard.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/login/widget/button/desktop_button.dart';
import 'package:flutter/material.dart';

ValueNotifier<bool> isVisibile = ValueNotifier<bool>(true);

class DesktopViewLogin extends StatelessWidget {
  DesktopViewLogin({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/background.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: AppColors.accentColor1,
                    ),
                  ),
                  Positioned(
                    bottom: 370,
                    left: 160,
                    child: Text(
                      'Welcome Back',
                      style: AppStyles.splashText1,
                    ),
                  ),
                  Positioned(
                    bottom: 290,
                    left: 165,
                    child: Text(
                        'To keep connected with us please\n    login with your personal info',
                        style: AppStyles.dashboardText),
                  ),
                  // Positioned(
                  //   bottom: 210,
                  //   left: 200,
                  //   child: OutlinedButton(
                  //       onPressed: () {},
                  //       child: Container(
                  //         height: 40,
                  //         width: 140,
                  //         child: Center(
                  //           child: Text(
                  //             'SignUp',
                  //             style: GoogleFonts.lora(
                  //                 color: Colors.black87,
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       )),
                  // )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: AppColors.primaryColor,
            ),
            //login area

            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: AppColors.secondaryColor,
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
                                style: AppStyles.loginText1,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Your Personal English Coach",
                                style: AppStyles.loginText2,
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
                        child: Expanded(
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
                                  color: AppColors.shadowColor,
                                ),
                              ],
                            ),
                            child: SingleChildScrollView(
                              child: Form(
                                key: formkey,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      'SignIn',
                                      style: AppStyles.loginText1,
                                    ),
                                    const SizedBox(height: 30),
                                    Center(
                                      child: TextArea(
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                            return 'please enter number';
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
                                              obscureText: isVisibile.value,
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
                                                        color: AppColors
                                                            .actionColor1,
                                                      )
                                                    : const Icon(
                                                        Icons.visibility_off,
                                                        color: AppColors
                                                            .actionColor1,
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
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 40.0),
                                          child: Text(
                                            'New password?',
                                            style:AppStyles.bodyText,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    ButtonDesktop(
                                      text: 'LOGIN',
                                      onpressed: () {
                                        if (formkey.currentState!.validate()) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ResponsiveDashBoard()));
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 30),
                                  ],
                                ),
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
          ],
        ),
      ),
    );
  }
}
