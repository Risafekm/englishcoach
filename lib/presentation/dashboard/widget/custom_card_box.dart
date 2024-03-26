import 'package:flutter/material.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardBox extends StatelessWidget {
  final String title;
  final int count; // Change the type to int
  final IconData icons;
  const CustomCardBox({
    Key? key,
    required this.title,
    required this.count,
    required this.icons, // Update the constructor parameter
  }) : super(key: key);

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
          const SizedBox(height: 20),
          Icon(
            icons,
            size: 28,
            color: AppColors.accentColor1,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.ubuntu(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Total Count',
            style: GoogleFonts.ubuntu(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '$count', // Display the count
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
