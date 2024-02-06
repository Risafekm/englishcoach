import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 184, 205, 221),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                "englishcoach",
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Your Personal English Coach",
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              // Image.asset(
              //   "asset/images/logo.png",
              //   fit: BoxFit.fitWidth,
              //   width: 400,
              //   height: 400,
              // ),
              const SizedBox(
                height: 60,
              ),
              const TextFormFieldSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormFieldSection extends StatefulWidget {
  const TextFormFieldSection({super.key});

  @override
  State<TextFormFieldSection> createState() => _TextFormFieldSectionState();
}

TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
String errorMessage = '';
// String? validateEmail(String? formEmail) {
//   if (formEmail == null || formEmail.isEmpty) {
//     return 'E-mail address is required.';
//   }

//   String pattern = r'\w+@\w+\.\w+';
//   RegExp regex = RegExp(pattern);
//   if (!regex.hasMatch(formEmail)) return 'Please enter correct Email';

//   return null;
// }

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Password is required.';
  }

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return '''
      Wrong password, Please enter correct Password
      
      ''';
  }

  return null;
}

class _TextFormFieldSectionState extends State<TextFormFieldSection> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          IntlPhoneField(
            keyboardType: TextInputType.phone,
            // focusNode: (),
            dropdownTextStyle: const TextStyle(fontSize: 18),
            style: const TextStyle(fontSize: 18),
            dropdownIcon: const Icon(
              Icons.arrow_drop_down,
              size: 28,
            ),
            decoration: InputDecoration(
              labelText: 'Your Mobile',
              labelStyle: GoogleFonts.poppins(
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(),
              ),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            validator: validatePassword,
            obscureText: true,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.black,
              ),
              labelText: "Enter Password",
              labelStyle: GoogleFonts.poppins(
                color: Colors.black,
              ),
              // filled: true,
              // fillColor: Colors.white.withOpacity(0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const Home(),
                //       ),
                //     );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Color.fromARGB(255, 32, 81, 127);
                  }
                  return Color.fromARGB(255, 39, 130, 95);
                }),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Text(
                'LOG IN',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
