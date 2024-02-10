import 'package:flutter/material.dart';

import '../dashboard.dart';

class MyTeacher extends StatelessWidget {
  const MyTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashBoardPage()));
          },
        ),
      ),
      body: Center(
        child: Text('My Teacher'),
      ),
    );
  }
}