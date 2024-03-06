import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'const_colors.dart';

class AppStyles {
  static TextStyle appBarTitle = GoogleFonts.cabin(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: AppColors.secondaryColor,
  );

  static TextStyle drawerText = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w500,  
    color: AppColors.secondaryColor
  );

  static  TextStyle bodyText = GoogleFonts.actor(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: AppColors.primaryColor,
  );
   static  TextStyle buttonText = GoogleFonts.lato(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryColor,
  );

   static TextStyle splashText1 = GoogleFonts.ubuntu(
    fontSize: 40,
    fontWeight: FontWeight.w500,  
    color: AppColors.secondaryColor
   
  );
   static TextStyle splashText2= GoogleFonts.teko(
    fontSize: 15,
    fontWeight: FontWeight.w500,  
    color: AppColors.secondaryColor,
  );
  static TextStyle loginText1= GoogleFonts.ubuntu(
    fontSize: 30,
    fontWeight: FontWeight.w500,  
    color: AppColors.primaryColor,
  );
  static TextStyle loginText2= GoogleFonts.teko(
    fontSize: 14,
    fontWeight: FontWeight.w500,  
    color: AppColors.primaryColor,
  );
  static TextStyle dashboardText= GoogleFonts.lato(
    fontSize: 17,
    fontWeight: FontWeight.w400,  
    color: AppColors.secondaryColor,
  );

  static TextStyle numStyle= GoogleFonts.lato(
    fontSize: 55,
    fontWeight: FontWeight.w400,  
    color: AppColors.primaryColor,
  );

}