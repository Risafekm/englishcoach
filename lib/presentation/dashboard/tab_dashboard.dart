import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:flutter/material.dart';
import '../drawer/drawer.dart';
import 'widget/custom_card_widget.dart';

class TabViewDashBoard extends StatelessWidget {
  const TabViewDashBoard({super.key});

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: CustomCard(
                  text: 'No Of Questions',
                  icon: Icons.arrow_forward_ios,
                  ontap: () {},
                ),
              ),
              Expanded(
                child: CustomCard(
                  text: 'No of Students',
                  icon: Icons.arrow_forward_ios,
                  ontap: () {},
                ),
              ),
              Expanded(
                child: CustomCard(
                  text: 'No of Answers',
                  icon: Icons.arrow_forward_ios,
                  ontap: () {},
                ),
              ),
              Expanded(
                child: CustomCard(
                  text: 'List toppers',
                  icon: Icons.arrow_forward_ios,
                  ontap: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
