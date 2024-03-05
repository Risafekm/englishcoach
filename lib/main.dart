import 'package:englishcoach/application/provider/user_provider_final_test.dart';
import 'package:englishcoach/application/provider/user_provider_password_update.dart';
import 'package:englishcoach/application/provider/user_provider_topic_test.dart';
import 'package:englishcoach/application/provider/userprovider_exercises.dart';
import 'package:englishcoach/application/provider/userprovider_modules.dart';
import 'package:englishcoach/application/provider/userprovider_test1.dart';
import 'package:englishcoach/application/provider/userprovider_test2.dart';
import 'package:englishcoach/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => userprovidertest1()),
        ChangeNotifierProvider(create: (context) => UserProviderTest2()),
        ChangeNotifierProvider(create: (context) => UserproviderModules()),
        ChangeNotifierProvider(create: (context) => UserProviderExercises()),
        ChangeNotifierProvider(create: (context) => UserproviderFinalTest()),
        ChangeNotifierProvider(create: (context) => UserproviderTopicTest()),
        ChangeNotifierProvider(create: (context) => UserproviderPassword()),
      ],
      child: const RootScreen(),
    ),
  );
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
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
