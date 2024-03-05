// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:flutter/material.dart';

class DrawerIconTextDesktop extends StatelessWidget {
  String text;
  IconData icon;
  VoidCallback onTap;
  bool selected;

  DrawerIconTextDesktop({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        selected: selected,
        onTap: onTap,
        leading: Icon(
          icon,
          color: AppColors.secondaryColor,
        ),
        title: Text(
          text.toString(),
          overflow: TextOverflow.ellipsis,
          style: AppStyles.drawerText,
        ),
      ),
    );
  }
}
