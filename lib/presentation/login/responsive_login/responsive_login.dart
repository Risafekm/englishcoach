import 'package:englishcoach/domain/const/const_screen.dart';
import 'package:englishcoach/presentation/login/desktop_login.dart';
import 'package:englishcoach/presentation/login/mobile_login.dart';
import 'package:englishcoach/presentation/login/tab_login.dart';
import 'package:flutter/material.dart';

class ResponsiveLogin extends StatelessWidget {
  const ResponsiveLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //mobile
        if (constraints.maxWidth < mobile_width) {
          return const MobileViewLogin();
        }
        // Tab
        else if (constraints.maxWidth < tab_width) {
          return const TabViewLogin();
        }
        //Desktop
        else {
          return DesktopViewLogin();
        }
      },
    );
  }
}
