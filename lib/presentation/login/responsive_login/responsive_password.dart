import 'package:flutter/material.dart';
import 'package:englishcoach/domain/const/const_screen.dart';
import 'package:englishcoach/presentation/login/widget/change_password/change_password_desktop.dart';
import 'package:englishcoach/presentation/login/widget/change_password/change_password_mobile.dart';
import 'package:englishcoach/presentation/login/widget/change_password/change_password_tablet.dart';

class ResponsivePassword extends StatelessWidget {
  // Define the GlobalKey<FormState> outside the build method
  // final GlobalKey<FormState> globalChangePasswordKey = GlobalKey<FormState>();

  ResponsivePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Mobile
        if (constraints.maxWidth < mobile_width) {
          return MobileChangePassword();
        }
        // Tablet
        else if (constraints.maxWidth < tab_width) {
          return TabChangePassword();
        }
        // Desktop
        else {
          return ChangePassword();
        }
      },
    );
  }
}
