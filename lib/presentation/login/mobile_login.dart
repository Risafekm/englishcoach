// ignore_for_file: avoid_print
import 'package:englishcoach/presentation/login/widget/button/custom_provider.dart';
import 'package:flutter/material.dart';

class MobileViewLogin extends StatefulWidget {
  const MobileViewLogin({super.key});

  @override
  State<MobileViewLogin> createState() => _MobileViewLoginState();
}

class _MobileViewLoginState extends State<MobileViewLogin> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 184, 205, 221),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 184, 205, 221),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset(
                  "assets/splashicon.png",
                  scale: 2.4,
                  // fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),

                const CustomProvider(),
                // MobileTextFormFieldSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class MobileTextFormFieldSection extends StatefulWidget {
//   const MobileTextFormFieldSection({super.key});

//   @override
//   State<MobileTextFormFieldSection> createState() =>
//       _TextFormFieldSectionState();
// }

// class _TextFormFieldSectionState extends State<MobileTextFormFieldSection> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<UserproviderPassword>(
//       create: (context) => UserproviderPassword(),
//       builder: (context, child) {
//         return LoginForm();
//       },
//     );
//   }
// }
