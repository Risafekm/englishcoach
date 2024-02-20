// ignore_for_file: must_be_immutable

import 'package:englishcoach/application/provider/userprovider_exercises.dart';
import 'package:englishcoach/domain/model/exercisesmodel.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditExercises extends StatelessWidget {
  Exercises user;
  EditExercises({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserProviderExercises>(context);

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        elevation: 3,
        title: Text(
          'Edit Test 2 Questions',
          style: GoogleFonts.lora(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'Question No ${user.exeNum}',
              style:
                  GoogleFonts.lora(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            const SizedBox(height: 50),
            TextArea(
              keyboardType: TextInputType.text,
              name: 'modNum',
              controller: controller.editModnumController,
              validator: (value) {
                return null;
              },
              suffixIcon: const Icon(
                Icons.abc,
                color: Colors.transparent,
              ),
              obscureText: false,
              prefixIcon: const Icon(Icons.comment),
            ),
            const SizedBox(height: 20),
            TextArea(
              keyboardType: TextInputType.text,
              name: 'Question',
              controller: controller.editQuesController,
              validator: (value) {
                return null;
              },
              suffixIcon: const Icon(
                Icons.abc,
                color: Colors.transparent,
              ),
              obscureText: false,
              prefixIcon: const Icon(Icons.question_mark),
            ),
            const SizedBox(height: 20),
            TextArea(
              keyboardType: TextInputType.text,
              name: 'Answer',
              controller: controller.editAnsController,
              validator: (value) {
                return null;
              },
              suffixIcon: const Icon(
                Icons.abc,
                color: Colors.transparent,
              ),
              obscureText: false,
              prefixIcon: const Icon(Icons.question_answer),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Update',
              ontap: () {
                Provider.of<UserProviderExercises>(context, listen: false)
                    .updateData(user.exeNum, context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
