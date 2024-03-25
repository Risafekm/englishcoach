// ignore_for_file: must_be_immutable

import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardBox extends StatelessWidget {
  String title;
  String count;
  CustomCardBox({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      margin: const EdgeInsets.only(top: 5),
      decoration: const BoxDecoration(
        color: AppColors.accentColor2,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            title,
            style: GoogleFonts.ubuntu(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryColor),
          ),
          const SizedBox(height: 20),
          Text(
            'Total Count',
            style: GoogleFonts.ubuntu(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryColor),
          ),
          Text(
            count,
            style: GoogleFonts.lora(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryColor),
          ),
        ],
      ),
    );
  }
}
