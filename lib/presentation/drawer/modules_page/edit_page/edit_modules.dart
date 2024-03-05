// ignore_for_file: must_be_immutable

import 'package:englishcoach/application/provider/userprovider_modules.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/domain/model/modulesmodel.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditModules extends StatelessWidget {
  EditModules({super.key, required this.user});

  Modules user;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserproviderModules>(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Edit Test 2 Questions',
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
              Text(
                'Question No ${user.modName}',
                style: AppStyles.bodyText,
              ),
              const SizedBox(height: 50),
              TextArea(
                keyboardType: TextInputType.text,
                name: 'mod order',
                controller: controller.editmodorderController,
                validator: (value) {
                  return null;
                },
                suffixIcon: const Icon(
                  Icons.abc,
                  color: AppColors.transColor,
                ),
                obscureText: false,
                prefixIcon: const Icon(Icons.flash_auto_outlined),
              ),
              const SizedBox(height: 20),
              TextArea(
                keyboardType: TextInputType.text,
                name: 'heading',
                controller: controller.editmodnameController,
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
                name: 'Content',
                controller: controller.editmodcontentController,
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
                name: 'Description',
                controller: controller.editmoddescriptionController,
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
                name: 'Special note',
                controller: controller.editmodspecialnoteController,
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
                name: 'tnum',
                controller: controller.edittnumController,
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
                  Provider.of<UserproviderModules>(context, listen: false)
                      .updateData(user.modNum, context);
                  Navigator.pop(context);
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
