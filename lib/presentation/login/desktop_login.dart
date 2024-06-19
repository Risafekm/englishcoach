// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/presentation/login/widget/button/custom_provider.dart';
import 'package:flutter/material.dart';

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
                    decoration:
                        const BoxDecoration(color: AppColors.accentColor1),
                  ),
                  Positioned(
                    top: 50,
                    right: 50,
                    left: 50,
                    bottom: 50,
                    child: Image.asset(
                      "assets/splashicon.png",
                      scale: 1.4,
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
                      const SizedBox(height: 120),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                          child: const SingleChildScrollView(
                            child: CustomProvider(),
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
