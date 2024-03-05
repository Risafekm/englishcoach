import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:flutter/material.dart';
import 'widget/build_header.dart';
import 'widget/build_menu_item.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: AppColors.accentColor1,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BuildHeader(),
            BuildMenuItem(),
          ],
        ),
      ),
    );
  }
}
