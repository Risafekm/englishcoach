import 'package:englishcoach/Application/Provider/userprovider_test1.dart';
import 'package:englishcoach/presentation/drawer/priliminary_test1/test1_home/widgets/custom_button.dart';
import 'package:englishcoach/presentation/drawer/priliminary_test1/test1_home/widgets/textArea.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InsertModalSheet extends StatelessWidget {
  const InsertModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    var controller = Provider.of<userprovidertest1>(context, listen: false);

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
          TextArea(
            keyboardType: TextInputType.text,
            name: 'Question',
            controller: controller.questionController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter Question';
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
          const SizedBox(height: 20),
          TextArea(
            keyboardType: TextInputType.text,
            name: 'Answer',
            controller: controller.answersController,
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
          const SizedBox(height: 20),
          CustomButton(
            text: 'Post',
            ontap: () {
              if (formkey.currentState!.validate()) {
                Provider.of<userprovidertest1>(context, listen: false)
                    .addData(context);

                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
