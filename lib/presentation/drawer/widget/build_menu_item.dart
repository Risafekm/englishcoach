import 'package:englishcoach/presentation/drawer/final_tests/final_test.dart';
import 'package:englishcoach/presentation/drawer/modules_exercises_page/exercises_page.dart';
import 'package:englishcoach/presentation/drawer/modules_page/modules_page.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/test2_home.dart';
import 'package:englishcoach/presentation/drawer/priliminary_tests1/Test1_homepage/Test1_home.dart';
import 'package:englishcoach/presentation/drawer/topic_tests/topic_tests.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            trailing: const Icon(Icons.assignment, color: Colors.white),
            title: Text(
              'Preliminary Test 1',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.white,
              )),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Test1Home()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.assignment,
              color: Colors.white,
            ),
            title: Text(
              'Preliminary Test 2',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.white,
              )),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Test2Home()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.view_module_sharp,
              color: Colors.white,
            ),
            title: Text(
              'Modules page',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.white,
              )),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ModulesPage()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.home_work_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Modules Exercises',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white)),
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
              Icons.assignment,
              color: Colors.white,
            ),
            title: Text(
              'Topic tests',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.white,
              )),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TopicTests()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.assignment,
              color: Colors.white,
            ),
            title: Text(
              'Final tests',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.white,
              )),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FinalTests()));
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.power_settings_new_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white)),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
