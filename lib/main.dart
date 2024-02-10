import 'package:englishcoach/application/provider/userprovider_test2.dart';
import 'package:englishcoach/presentation/login/splash_screen.dart';
import 'package:englishcoach/Application/Provider/userprovider_test1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => userprovidertest1()),
        ChangeNotifierProvider(create: (context) => UserProviderTest2()),
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
