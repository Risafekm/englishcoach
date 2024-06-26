import 'package:englishcoach/domain/export/export.dart';
import 'package:englishcoach/presentation/drawer/coupon/desktop_coupon.dart';
import 'package:englishcoach/presentation/drawer/logout/logoutpage.dart';

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
    const DesktopTopicTests(),
    const DesktopFinalTests(),
    const DesktopMcqQuestions(),
    const DesktopTrailModules(),
    const DesktopCoupon(),
    const LogoutPage(),
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
                decoration: const BoxDecoration(
                  color: AppColors.accentColor1,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
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
                            fit: BoxFit.fitHeight,
                            scale: 1,
                            image: AssetImage("LogoApp.jpg"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    DrawerIconTextDesktop(
                      text: 'Dashboard',
                      icon: Icons.dashboard,
                      onTap: () {
                        _onItemTapped(0);
                      },
                      selected: false,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Preliminary Test 1',
                      icon: Icons.edit,
                      onTap: () {
                        _onItemTapped(1);
                      },
                      selected: _selectedIndex == 1,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Preliminary Test 2',
                      icon: Icons.edit,
                      onTap: () {
                        _onItemTapped(2);
                      },
                      selected: _selectedIndex == 2,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Modules ',
                      icon: Icons.draw,
                      onTap: () {
                        _onItemTapped(3);
                      },
                      selected: _selectedIndex == 3,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Modules Exercises',
                      icon: Icons.draw,
                      onTap: () {
                        _onItemTapped(4);
                      },
                      selected: _selectedIndex == 4,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Topic Tests',
                      icon: Icons.edit,
                      onTap: () {
                        _onItemTapped(5);
                      },
                      selected: _selectedIndex == 5,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Final Tests',
                      icon: Icons.edit,
                      onTap: () {
                        _onItemTapped(6);
                      },
                      selected: _selectedIndex == 6,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Mcq Questions',
                      icon: Icons.comment,
                      onTap: () {
                        _onItemTapped(7);
                      },
                      selected: _selectedIndex == 7,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Trail Modules',
                      icon: Icons.comment,
                      onTap: () {
                        _onItemTapped(8);
                      },
                      selected: _selectedIndex == 8,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Coupon Code',
                      icon: Icons.local_offer_rounded,
                      onTap: () {
                        _onItemTapped(9);
                      },
                      selected: _selectedIndex == 9,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Logout',
                      icon: Icons.logout,
                      onTap: () {
                        _onItemTapped(10);
                      },
                      selected: _selectedIndex == 10,
                    ),
                  ],
                ),
              ),
            ),

            // center screen
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: MediaQuery.of(context).size.height,
                  child: pages[_selectedIndex],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
