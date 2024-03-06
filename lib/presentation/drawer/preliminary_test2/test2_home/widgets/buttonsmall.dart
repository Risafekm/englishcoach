// ignore_for_file: must_be_immutable

import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/const/const_styles.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback ontap;
  CustomButton({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.accentColor2),
        child: Center(
          child: Text(
            text,
            style: AppStyles.buttonText,
          ),
        ),
      ),
    );
  }
}
