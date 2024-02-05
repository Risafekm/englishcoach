import 'package:englishcoach/presentation/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RootScreen());
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DashBoardPage(),
    );
  }
}
