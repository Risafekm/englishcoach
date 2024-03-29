// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  String name;
  Widget prefixIcon;
  Widget suffixIcon;
  TextEditingController controller;
  String? Function(String?)? validator;
  bool obscureText;
  TextInputType keyboardType;

  TextArea({
    Key? key,
    required this.keyboardType,
    required this.name,
    required this.prefixIcon,
    required this.controller,
    required this.validator,
    required this.suffixIcon,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: true,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.black, fontSize: 16),
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(.4),
          filled: true,
          label: Text(
            name.toString(),
            style: const TextStyle(color: Colors.black),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.5),
              width: 2,
            ),
          ),
          labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
          prefixIcon: prefixIcon,
          prefixIconColor: const Color.fromARGB(255, 69, 68, 68),
          suffixIcon: suffixIcon,
          suffixIconColor: const Color.fromARGB(255, 69, 68, 68),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.5),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.5),
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
