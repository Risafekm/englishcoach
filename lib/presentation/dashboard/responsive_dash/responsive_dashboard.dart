import 'package:englishcoach/domain/const/const_screen.dart';
import 'package:englishcoach/presentation/dashboard/desktop_dashboard.dart';
import 'package:englishcoach/presentation/dashboard/mobile_dashboard.dart';
import 'package:englishcoach/presentation/dashboard/tab_dashboard.dart';
import 'package:flutter/material.dart';

class ResponsiveDashBoard extends StatelessWidget {
  const ResponsiveDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //mobile
        if (constraints.maxWidth < mobile_width) {
          return const MobileViewDashBoard();
        }
        // Tab
        else if (constraints.maxWidth < tab_width) {
          return const TabViewDashBoard();
        }
        //Desktop
        else {
          return const DesktopViewDashBoard();
        }
      },
    );
  }
}
