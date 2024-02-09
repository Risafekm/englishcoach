import 'package:englishcoach/application/provider/userprovider.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test/preliminary_test_page.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test/test2/test2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
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
      // home: PriliminaryTest(),
      home: Test2(),
    );
  }
}
