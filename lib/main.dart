<<<<<<< HEAD
import 'package:englishcoach/application/provider/userprovider_test2.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/test2_home.dart';
=======
import 'package:englishcoach/presentation/login/splash_screen.dart';
>>>>>>> shalima
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProviderTest2()),
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
<<<<<<< HEAD
<<<<<<< HEAD
      // home: Test2Home(),
=======
      // home: DashBoardPage(),
>>>>>>> rusafida
=======
      home: SplashScreen(),
>>>>>>> shalima
    );
  }
}
