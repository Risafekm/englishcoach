// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:englishcoach/presentation/dashboard/responsive_dash/responsive_dashboard.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/login/widget/button/desktop_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ValueNotifier<bool> isVisibile = ValueNotifier<bool>(true);

class DesktopViewLogin extends StatelessWidget {
  DesktopViewLogin({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formkey = GlobalKey<FormState>();

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
                  const Positioned(
                    bottom: 290,
                    left: 150,
                    child: Text(
                      'To keep connected with us please\n    login with your personal info',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54),
                    ),
                  ),
                  Positioned(
                    bottom: 210,
                    left: 200,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Container(
                          height: 40,
                          width: 140,
                          child: Center(
                            child: Text(
                              'SignUp',
                              style: GoogleFonts.lora(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  )
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
                      // const SizedBox(height: 10),
                      Center(
                        child: Expanded(
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
                                      'SignIn',
                                      style: GoogleFonts.lora(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
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
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 40.0),
                                          child: Text(
                                            'New password',
                                            style: GoogleFonts.acme(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black54),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    ButtonDesktop(
                                      text: 'Login',
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
