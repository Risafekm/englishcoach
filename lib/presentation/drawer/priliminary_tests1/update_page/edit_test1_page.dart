// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:englishcoach/application/provider/userprovider_test1.dart';
import 'package:englishcoach/domain/Model/quizTest1model.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPageTest1 extends StatelessWidget {
  EditPageTest1({super.key, required this.user});

  QuizTest1 user;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<userprovidertest1>(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        elevation: 3,
        title: Text(
          'Edit Test 2 Questions',
          style: AppStyles.appBarTitle,
        ),
        centerTitle: true,
         leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.secondaryColor,
            ),
          ),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'Question No ${user.topic_que_num}',
             style: AppStyles.bodyText,
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
                color: AppColors.transColor,
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
                color: AppColors.transColor,
              ),
              obscureText: false,
              prefixIcon: const Icon(Icons.question_answer),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'UPDATE',
              ontap: () {
                Provider.of<userprovidertest1>(context, listen: false)
                    .updateData(user.topic_que_num, context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
