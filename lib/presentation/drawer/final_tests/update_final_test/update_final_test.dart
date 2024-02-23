// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:englishcoach/application/provider/user_provider_final_test.dart';
import 'package:englishcoach/domain/model/final_test_model.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateFinalTest extends StatelessWidget {
  UpdateFinalTest({super.key, required this.user});

  FinalTest user;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserproviderFinalTest>(context);

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        elevation: 3,
        title: Text(
          'Edit Final Test',
          style: GoogleFonts.lora(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'Question No ${user.finalQuesNumber}',
              style:
                  GoogleFonts.lora(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            const SizedBox(height: 50),
            TextArea(
              keyboardType: TextInputType.text,
              name: 'Question',
              controller: controller.updatequestionController,
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
              controller: controller.updateanswersController,
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
                Provider.of<UserproviderFinalTest>(context, listen: false)
                    .updateData(user.finalQuesNumber, context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
