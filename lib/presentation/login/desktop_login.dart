// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:englishcoach/presentation/login/widget/button/FormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:englishcoach/Application/Provider/user_provider_password_update.dart';

ValueNotifier<bool> isVisibile = ValueNotifier<bool>(true);

class DesktopViewLogin extends StatelessWidget {
  DesktopViewLogin({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> desktopFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 231, 73)
                            .withOpacity(.5)),
                  ),
                  Positioned(
                    bottom: 370,
                    left: 160,
                    child: Text(
                      'Welcome Back',
                      style: GoogleFonts.lora(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
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
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
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
                            child: ChangeNotifierProvider<UserproviderPassword>(
                              create: (context) => UserproviderPassword(),
                              child: LoginForm(),
                            ),
                            // child: LoginForm(),
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
