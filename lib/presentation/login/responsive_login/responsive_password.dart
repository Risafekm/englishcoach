// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:englishcoach/domain/const/const_screen.dart';
import 'package:englishcoach/presentation/login/widget/change_password/change_password_desktop.dart';
import 'package:englishcoach/presentation/login/widget/change_password/change_password_mobile.dart';
import 'package:englishcoach/presentation/login/widget/change_password/change_password_tablet.dart';

class ResponsivePassword extends StatelessWidget {
  ResponsivePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Mobile
        if (constraints.maxWidth < mobile_width) {
          return const MobileChangePassword();
        }
        // Tablet
        else if (constraints.maxWidth < tab_width) {
          return const TabChangePassword();
        }
        // Desktop
        else {
          return DesktopChangePassword();
        }
      },
    );
  }
}
