// ignore_for_file: must_be_immutable

import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:flutter/material.dart';

class ButtonDesktop extends StatelessWidget {
  VoidCallback onpressed;
  String text;
  ButtonDesktop({
    Key? key,
    required this.onpressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * .7,
        decoration: BoxDecoration(
            color: AppColors.actionColor1,
            borderRadius: BorderRadius.circular(20)),
        child: ElevatedButton(
            onPressed: onpressed,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.accentColor2),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: Text(
              text,
              style: AppStyles.buttonText,
            )),
      ),
    );
  }
}
