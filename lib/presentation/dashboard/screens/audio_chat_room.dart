import 'package:flutter/material.dart';

import '../dashboard.dart';

class AudioChatRoom extends StatelessWidget {
  const AudioChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
     return   Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashBoardPage()));
          },
        ),
      ),
     body:const Center(
      child: Text('Audio Chat Room'),
     ),
    );
  }
}