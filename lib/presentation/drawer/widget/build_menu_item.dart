import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/drawer/final_tests/final_test.dart';
import 'package:englishcoach/presentation/drawer/mcq_questions/mcq_page.dart';
import 'package:englishcoach/presentation/drawer/modules_exercises_page/exercises_page.dart';
import 'package:englishcoach/presentation/drawer/modules_page/modules_page.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/test2_home.dart';
import 'package:englishcoach/presentation/drawer/priliminary_tests1/Test1_homepage/test1_home.dart';
import 'package:englishcoach/presentation/drawer/topic_tests/topic_tests.dart';
import 'package:englishcoach/presentation/drawer/trail_modules/trail_modules.dart';
import 'package:flutter/material.dart';

class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 10,
        children: [
          ListTile(
            trailing: const Icon(
              Icons.home,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              'Preliminary Test 1',
              style: AppStyles.drawerText,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Test1()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.person,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              'Preliminary Test 2',
              style: AppStyles.drawerText,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Test2Home()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.settings,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              'Modules Page',
              style: AppStyles.drawerText,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ModulesPage()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.sports_gymnastics,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              'Modules Exercises',
              style: AppStyles.drawerText,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExercisesPage()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.history,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              'Topic Tests',
              style: AppStyles.drawerText,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TopicTests()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.assignment,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              'Final Tests',
              style: AppStyles.drawerText,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FinalTests()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.comment,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              'Mcq questions',
              style: AppStyles.drawerText,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const McqPage()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.comment,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              'Trail modules',
              style: AppStyles.drawerText,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TrailModules()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.power_settings_new_rounded,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              'Logout',
              style: AppStyles.drawerText,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
