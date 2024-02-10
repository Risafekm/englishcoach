import 'package:flutter/material.dart';

class MyTeacher extends StatelessWidget {
  const MyTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text('My Teacher'),
      ),
    );
  }
}
