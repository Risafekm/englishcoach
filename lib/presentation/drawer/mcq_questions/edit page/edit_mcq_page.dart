// ignore_for_file: must_be_immutable

import 'package:englishcoach/application/provider/userprovider_mcq.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/domain/model/mcq_model.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditMcqPage extends StatelessWidget {
  EditMcqPage({super.key, required this.user});

  McqModel user;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserMcqQuestionsOptions>(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Edit Mcq Questions & Options',
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const SizedBox(height: 20),
              TextArea(
                keyboardType: TextInputType.text,
                name: 'Question',
                controller: controller.editquestionController,
                validator: (value) {
                  return null;
                },
                suffixIcon: const Icon(
                  Icons.abc,
                  color: AppColors.transColor,
                ),
                obscureText: false,
                prefixIcon: const Icon(Icons.title),
              ),
              const SizedBox(height: 20),
              TextArea(
                keyboardType: TextInputType.text,
                name: 'Answer',
                controller: controller.editanswersController,
                validator: (value) {
                  return null;
                },
                suffixIcon: const Icon(
                  Icons.abc,
                  color: AppColors.transColor,
                ),
                obscureText: false,
                prefixIcon: const Icon(Icons.comment),
              ),
              const SizedBox(height: 20),
              TextArea(
                keyboardType: TextInputType.text,
                name: 'Option 1',
                controller: controller.editoption1Controller,
                validator: (value) {
                  return null;
                },
                suffixIcon: const Icon(
                  Icons.abc,
                  color: AppColors.transColor,
                ),
                obscureText: false,
                prefixIcon: const Icon(Icons.comment),
              ),
              const SizedBox(height: 20),
              TextArea(
                keyboardType: TextInputType.text,
                name: 'Option 2',
                controller: controller.editoption2Controller,
                validator: (value) {
                  return null;
                },
                suffixIcon: const Icon(
                  Icons.abc,
                  color: AppColors.transColor,
                ),
                obscureText: false,
                prefixIcon: const Icon(Icons.comment),
              ),
              const SizedBox(height: 20),
              TextArea(
                keyboardType: TextInputType.text,
                name: 'Option 3',
                controller: controller.editoption3Controller,
                validator: (value) {
                  return null;
                },
                suffixIcon: const Icon(
                  Icons.abc,
                  color: AppColors.transColor,
                ),
                obscureText: false,
                prefixIcon: const Icon(Icons.comment),
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'UPDATE',
                ontap: () {
                  // Provider.of<UserMcqQuestionsOptions>(context, listen: false)
                  //     .updateData(user.modNum, context);
                  // Navigator.pop(context);
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
