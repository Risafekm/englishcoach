// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace
// ignore_for_file: must_be_immutable

import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
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
        style: AppStyles.bodyText,
        decoration: InputDecoration(
          fillColor: AppColors.secondaryColor,
          filled: true,
          label: Text(
            name.toString(),
            style: AppStyles.bodyText,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.accentColor1,
              width: 2,
            ),
          ),
          labelStyle: AppStyles.bodyText,
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.actionColor1,
          suffixIcon: suffixIcon,
          suffixIconColor: AppColors.transColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.accentColor1,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.accentColor2,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.actionColor2,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
