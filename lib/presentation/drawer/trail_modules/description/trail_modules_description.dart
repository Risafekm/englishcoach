// ignore_for_file: must_be_immutable

import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/domain/model/trail_modules_model.dart';
import 'package:flutter/material.dart';

class TrailDescriptionPage extends StatelessWidget {
  TrailModules data;
  TrailDescriptionPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.secondaryColor,
          ),
        ),
        title: Text(
          'Trial Modules',
          style: AppStyles.appBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              data.modName.toString(),
              style: AppStyles.bodyTextHead,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.modDescription.toString(),
                style: AppStyles.bodyText,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              data.modContent,
              style: AppStyles.bodyTextHead,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.modSpecialnote.toString(),
                style: AppStyles.bodyText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.modExampleExplanation.toString(),
                style: AppStyles.bodyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
