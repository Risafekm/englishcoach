// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:englishcoach/application/provider/user_provider_topic_test.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/domain/model/topictestmodel.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateTopicTest extends StatelessWidget {
  UpdateTopicTest({super.key, required this.user});

  TopicTest user;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserproviderTopicTest>(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Edit Topic Test',
          style: AppStyles.appBarTitle,
        ),
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
              'Question No ${user.topicQueNum}',
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
              suffixIcon: const Icon(Icons.abc, color: AppColors.transColor),
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
                Provider.of<UserproviderTopicTest>(context, listen: false)
                    .updateData(user.topicQueNum, context);
                Navigator.pop(context);
                snackbar(context, text: "updated");
              },
            ),
          ],
        ),
      ),
    );
  }

  //snackBar

  snackbar(context, {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.accentColor2,
        content: Row(
          children: [
            Expanded(child: Text('Successfully $text')),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.done, color: AppColors.accentColor1),
          ],
        ),
      ),
    );
  }
}
