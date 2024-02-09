// ignore_for_file: must_be_immutable

import 'package:englishcoach/test1/api/topic_json.dart';
import 'package:englishcoach/test1/api/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key, required this.user});

  Quiz user;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        elevation: 3,
        title: Text(
          'Edit Test 1 Questions',
          style: GoogleFonts.lora(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            'Question No ${user.topic_que_num}',
            style: GoogleFonts.lora(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: provider.updatequestionController,
              decoration: InputDecoration(
                labelText: 'Question',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black87,
                  ),
                ),
                suffixIcon: const Icon(
                  Icons.abc,
                  color: Colors.transparent,
                ),
                prefixIcon: const Icon(Icons.question_mark),
              ),
              obscureText: false,
              validator: (value) {
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: provider.updateanswersController,
              decoration: InputDecoration(
                labelText: 'Answer',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(
                  Icons.abc,
                  color: Colors.transparent,
                ),
                prefixIcon: const Icon(Icons.question_answer),
              ),
              obscureText: false,
              validator: (value) {
                return null;
              },
            ),
          ),
          const SizedBox(height: 35),
          ElevatedButton(
              onPressed: () async {
                provider.updateData(user.topic_que_num, context);
                Navigator.pop(context);
              },
              child: const Text('Update')),
        ],
      ),
    );
  }
}
