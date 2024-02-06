
import 'package:englishcoach/presentation/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class PreliminaryTest extends StatelessWidget {
  const PreliminaryTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashBoardPage()));
          },
        ),
      ),
      body: const Center(
        child: Text('Preliminary Test'),
      ),
    );
  }
}
