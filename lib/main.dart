import 'package:englishcoach/application/provider/user_provider_final_test.dart';
import 'package:englishcoach/application/provider/user_provider_mcqquestion.dart';
import 'package:englishcoach/application/provider/user_provider_password_update.dart';
import 'package:englishcoach/application/provider/user_provider_topic_test.dart';
import 'package:englishcoach/application/provider/user_provider_trail_modules.dart';
import 'package:englishcoach/application/provider/userprovider_exercises.dart';
import 'package:englishcoach/application/provider/userprovider_modules.dart';
import 'package:englishcoach/application/provider/userprovider_test1.dart';
import 'package:englishcoach/application/provider/userprovider_test2.dart';
import 'package:englishcoach/presentation/dashboard/responsive_dash/responsive_dashboard.dart';
import 'package:englishcoach/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserproviderPassword()),
        ChangeNotifierProvider(create: (context) => UserProviderTest()),
        ChangeNotifierProvider(create: (context) => UserProviderTest2()),
        ChangeNotifierProvider(create: (context) => UserproviderModules()),
        ChangeNotifierProvider(create: (context) => UserProviderExercises()),
        ChangeNotifierProvider(create: (context) => UserproviderFinalTest()),
        ChangeNotifierProvider(create: (context) => UserproviderTopicTest()),
        ChangeNotifierProvider(create: (context) => UserProviderTrail()),
        ChangeNotifierProvider(create: (context) => UserProviderMcqQuestions()),
      ],
      child: const RootScreen(),
    ),
  );
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: ResponsiveDashBoard(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
