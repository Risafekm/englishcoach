import 'package:flutter/material.dart';

class AudioChatRoom extends StatelessWidget {
  const AudioChatRoom({super.key});

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
        child: Text('Audio Chat Room'),
      ),
    );
  }
}
