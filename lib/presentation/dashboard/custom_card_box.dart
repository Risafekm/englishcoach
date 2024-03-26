import 'package:flutter/material.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardBox extends StatelessWidget {
  final String title;
  final int count; // Change the type to int

  const CustomCardBox({
    Key? key,
    required this.title,
    required this.count, // Update the constructor parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
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
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Total Count',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryColor,
            ),
          ),
          Text(
            'Count: $count', // Display the count
            style: GoogleFonts.lora(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
