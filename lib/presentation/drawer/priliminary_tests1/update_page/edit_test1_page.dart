// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:englishcoach/domain/Model/quizTest1model.dart';
import 'package:englishcoach/Application/Provider/userprovider_test1.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key, required this.user});

  QuizTest1 user;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<userprovidertest1>(context);
    var controller = Provider.of<userprovidertest1>(context, listen: false);
    final formkey = GlobalKey<FormState>();

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
            child: TextArea(
              keyboardType: TextInputType.text,
              name: 'Question',
              controller: controller.updatequestionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter answer';
                } else {
                  return null;
                }
              },
              suffixIcon: const Icon(
                Icons.abc,
                color: Colors.transparent,
              ),
              obscureText: false,
              prefixIcon: const Icon(Icons.question_mark),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextArea(
              keyboardType: TextInputType.text,
              name: 'Answer',
              controller: controller.updateanswersController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter answer';
                } else {
                  return null;
                }
              },
              suffixIcon: const Icon(
                Icons.abc,
                color: Colors.transparent,
              ),
              obscureText: false,
              prefixIcon: const Icon(Icons.question_answer),
            ),
          ),
          const SizedBox(height: 35),
          CustomButton(
            text: 'Post',
            ontap: () {
              if (formkey.currentState!.validate()) {
                Provider.of<userprovidertest1>(context, listen: false)
                    .updateData(user.topic_que_num, context);

                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
