// ignore_for_file: sized_box_for_whitespace

import 'package:englishcoach/presentation/dashboard/desktop_dash/desktop_dash_main.dart';
import 'package:englishcoach/presentation/dashboard/widget/drawer_icon_text_desktop.dart';
import 'package:englishcoach/presentation/drawer/final_tests/desktop_finaltests.dart';
import 'package:englishcoach/presentation/drawer/modules_exercises_page/desktop_modules_exercise.dart';
import 'package:englishcoach/presentation/drawer/modules_page/desktop_modules_page.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/desktop_test2_home.dart';
import 'package:englishcoach/presentation/drawer/priliminary_tests1/Test1_homepage/test1_desktop_home.dart';
import 'package:englishcoach/presentation/drawer/topic_tests/desktop_topictests.dart';
import 'package:flutter/material.dart';

class DesktopViewDashBoard extends StatefulWidget {
  const DesktopViewDashBoard({super.key});

  @override
  State<DesktopViewDashBoard> createState() => _DesktopViewDashBoardState();
}

class _DesktopViewDashBoardState extends State<DesktopViewDashBoard> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    DashBoardDesktop(),
    const DesktopTest1Home(),
    const DesktopTest2Home(),
    const DesktopModulesPage(),
    const DesktopExercisesPage(),
    const DesktopFinalTests(),
    const DesktopTopicTests(),
    const Center(child: Text('Logout')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // drawer area

            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white54,
                // color: Theme.of(context).colorScheme.onPrimary,
                child: ListView(
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 40.0,
                        top: 8,
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaPFJC-r3YeVbBL0ydVAMARkzcEliCloXfLw&usqp=CAU'),
                            )),
                      ),
                    ),
                    const SizedBox(height: 30),
                    DrawerIconTextDesktop(
                      text: 'DashBoard',
                      icon: Icons.dashboard,
                      onTap: () {
                        _onItemTapped(0);
                      },
                      selected: false,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Preliminary test 1',
                      icon: Icons.home,
                      onTap: () {
                        _onItemTapped(1);
                      },
                      selected: _selectedIndex == 1,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Preliminary test 2',
                      icon: Icons.person,
                      onTap: () {
                        _onItemTapped(2);
                      },
                      selected: _selectedIndex == 2,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Modules page',
                      icon: Icons.settings,
                      onTap: () {
                        _onItemTapped(3);
                      },
                      selected: _selectedIndex == 3,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Modules exercise',
                      icon: Icons.sports_gymnastics,
                      onTap: () {
                        _onItemTapped(4);
                      },
                      selected: _selectedIndex == 4,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Topic tests',
                      icon: Icons.history,
                      onTap: () {
                        _onItemTapped(5);
                      },
                      selected: _selectedIndex == 5,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Final tests',
                      icon: Icons.logout,
                      onTap: () {
                        _onItemTapped(6);
                      },
                      selected: _selectedIndex == 6,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Logout',
                      icon: Icons.logout,
                      onTap: () {
                        _onItemTapped(7);
                      },
                      selected: _selectedIndex == 7,
                    ),
                  ],
                ),
              ),
            ),

            // center screen
            Expanded(
              flex: 7,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: pages[_selectedIndex],
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
                height: MediaQuery.of(context).size.height,
                // child: const ProfileDesktop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
