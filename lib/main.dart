import 'package:englishcoach/presentation/drawer/preliminary_test/preliminary_test_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RootScreen());
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PriliminaryTest(),
    );
  }
}
