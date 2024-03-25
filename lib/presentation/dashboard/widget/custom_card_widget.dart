import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, required this.text, required this.icon, required this.ontap});

  final String text;
  final IconData icon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.accentColor2,
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: 150,
        decoration: BoxDecoration(
            color: AppColors.accentColor2,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("icon.png"),
            ),
            Text(
              text,
              style: AppStyles.dashboardText,
            ),
            GestureDetector(
                onTap: ontap,
                child: Icon(
                  icon,
                  color: AppColors.secondaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
