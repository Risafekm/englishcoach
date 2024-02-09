import 'package:englishcoach/test1/api/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InsertModalSheet extends StatelessWidget {
  const InsertModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Text(
            'Add new question & answer',
            style: GoogleFonts.lora(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: provider.questionController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter question';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              label: const Text('Question'),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              hintText: 'please enter question ',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black87),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black87),
              ),
              suffixIcon: const Icon(
                Icons.abc,
                color: Colors.transparent,
              ),
              prefixIcon: const Icon(Icons.question_mark),
            ),
            obscureText: false,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: provider.answersController,
            decoration: InputDecoration(
              label: const Text('Answer'),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              hintText: 'Paste your answer here',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black87),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black87),
              ),
              suffixIcon: const Icon(
                Icons.abc,
                color: Colors.transparent,
              ),
              prefixIcon: const Icon(Icons.question_answer),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter answer';
              } else {
                return null;
              }
            },
            obscureText: false,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              provider.addData(context);
              Navigator.pop(context);
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}
