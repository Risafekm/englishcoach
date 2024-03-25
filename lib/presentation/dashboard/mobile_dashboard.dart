import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/dashboard/widget/custom_card_box.dart';
import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class MobileViewDashBoard extends StatelessWidget {
  const MobileViewDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        centerTitle: true,
        title: Text(
          'English Coach',
          style: AppStyles.appBarTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.power_settings_new_rounded,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            const SizedBox(width: 5),
            Expanded(
              child: CustomCardBox(
                title: 'Modules',
                count: '34',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: CustomCardBox(
                title: 'Trial Modules',
                count: '12',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: CustomCardBox(
                title: 'Users',
                count: '4',
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
