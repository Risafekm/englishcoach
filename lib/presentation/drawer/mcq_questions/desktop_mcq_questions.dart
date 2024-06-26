// ignore_for_file: unused_local_variable, avoid_print

import 'package:englishcoach/application/provider/userprovider_mcq.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/drawer/mcq_questions/edit%20page/edit_mcq_page.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopMcqQuestions extends StatefulWidget {
  const DesktopMcqQuestions({super.key});
  @override
  State<DesktopMcqQuestions> createState() => _DesktopMcqQuestionsState();
}

class _DesktopMcqQuestionsState extends State<DesktopMcqQuestions> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserMcqQuestionsOptions>(context, listen: false).getData();
    });
    super.initState();
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserMcqQuestionsOptions>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55.0),
        child: Container(
          height: 100,
          decoration: const BoxDecoration(
              color: AppColors.accentColor1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
              ),
              Text(
                'Mcq Questions & Options',
                style: AppStyles.appBarTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        modelSheet(context);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.accentColor1,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<UserMcqQuestionsOptions>(builder: (context, value, child) {
        if (value.isLoding) {
          return const CircularProgressIndicator();
        }
        final posts = value.posts;
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            var user = posts[index];
            return Container(
              decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
              ),
              child: Card(
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: AppColors.accentColor1,
                        child: Text(
                          posts[index].questionNo.toString(),
                          style:
                              const TextStyle(color: AppColors.secondaryColor),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text(
                                'Question : ${posts[index].question}',
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.bodyTextwhite,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Option A: ${posts[index].options[0]}',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.optionText,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    'Option B: ${posts[index].options[1]}',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.optionText,
                                  ),
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Option C: ${posts[index].options[2]}',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.optionText,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Answer : ${posts[index].mcq_answer}',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.bodyTextwhite,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          controller.editquestionController.text =
                              posts[index].question;
                          controller.editanswersController.text =
                              posts[index].mcq_answer;
                          controller.editoption1Controller.text =
                              posts[index].options[0];
                          controller.editoption2Controller.text =
                              posts[index].options[1];
                          controller.editoption3Controller.text =
                              posts[index].options[2];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditMcqPage(user: user)));
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.accentColor1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'Delete Module ${posts[index].questionNo}',
                                    style: AppStyles.alertText,
                                  ),
                                  content: Text(
                                    'Are you sure?',
                                    style: AppStyles.bodyText,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: AppStyles.bodyText,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    TextButton(
                                      onPressed: () {
                                        controller.deleteData(
                                            user.questionNo.toString(),
                                            context);
                                        Navigator.pop(context);
                                        snackbar(context, text: "deleted");
                                      },
                                      child: Text(
                                        'yes',
                                        style: AppStyles.bodyText,
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: AppColors.actionColor2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

//floating action button function

  Future<dynamic> modelSheet(BuildContext context) {
    var controller =
        Provider.of<UserMcqQuestionsOptions>(context, listen: false);

    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        ),
        builder: (BuildContext context) {
          return Container(
              height: 550.0,
              color: AppColors.transColor,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          'Add new question & answer',
                          style: AppStyles.bodyText,
                        ),
                        const SizedBox(height: 50),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'Question',
                          controller: controller.questionController,
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
                          controller: controller.answersController,
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
                          controller: controller.option1Controller,
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
                          controller: controller.option2Controller,
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
                          controller: controller.option3Controller,
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
                        CustomButton(
                          text: 'POST',
                          ontap: () {
                            if (formkey.currentState!.validate()) {
                              Provider.of<UserMcqQuestionsOptions>(context,
                                      listen: false)
                                  .addData(context);
                              Navigator.pop(context);
                              snackbar(context, text: "added");
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ));
        });
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
