import 'package:flutter/material.dart';

import '../dashboard.dart';

class PreliminaryTest2 extends StatelessWidget {
  const PreliminaryTest2({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashBoardPage()));
          },
        ),
      ),
      body: Center(
        child: const Text('Preliminary Test 2'),
      ),
    );
  }
}