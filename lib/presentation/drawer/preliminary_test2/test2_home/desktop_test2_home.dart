// ignore_for_file: unused_local_variable, avoid_print

import 'package:englishcoach/application/provider/userprovider_test2.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/domain/model/quizTest2model.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/editpage/edit_test2_page.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopTest2Home extends StatefulWidget {
  const DesktopTest2Home({super.key});

  @override
  State<DesktopTest2Home> createState() => _DesktopTest2HomeState();
}

class _DesktopTest2HomeState extends State<DesktopTest2Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProviderTest2>(context, listen: false).getData();
    });
    super.initState();
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserProviderTest2>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Test 2 Questions & Answers',
          style: AppStyles.appBarTitle,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.secondaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    modelSheet(context);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.actionColor1,
                  )),
            ),
          ),
        ],
      ),
      body: Consumer<UserProviderTest2>(builder: (context, value, child) {
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
                  height: 80,
                  width: MediaQuery.of(context).size.width * 6,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      CircleAvatar(
                        child: Text(posts[index].prelimTransQuesNum.toString()),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Question : ${posts[index].prelimTransQuestion}',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.bodyText,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Answer : ${posts[index].prelimTransAnswer}',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.bodyText,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          controller.editQuesController.text =
                              posts[index].prelimTransQuestion.toString();
                          controller.editAnsController.text =
                              posts[index].prelimTransAnswer.toString();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  EditText2Page(user: posts[index])));
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.actionColor1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          deleteAlertBox(
                              context, posts, index, controller, user);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: AppColors.actionColor2,
                        ),
                      ),
                      const SizedBox(width: 10),
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

  Future<dynamic> deleteAlertBox(BuildContext context, List<QuizTest2> posts,
      int index, UserProviderTest2 controller, QuizTest2 user) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Delete Question ${posts[index].prelimTransQuesNum}',
              style: AppStyles.bodyText,
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
                      user.prelimTransQuesNum.toString(), context);
                  Navigator.pop(context);
                },
                child: Text(
                  'yes',
                  style: AppStyles.bodyText,
                ),
              ),
            ],
          );
        });
  }

//floating action button function

  Future<dynamic> modelSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        ),
        builder: (BuildContext context) {
          return Container(
              height: 450.0,
              color: AppColors.transColor,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
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
                      questionTextArea(),
                      const SizedBox(height: 20),
                      answerTextArea(),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'POST',
                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            Provider.of<UserProviderTest2>(context,
                                    listen: false)
                                .addData(context);

                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  TextArea questionTextArea() {
    var controller = Provider.of<UserProviderTest2>(context, listen: false);
    return TextArea(
      keyboardType: TextInputType.text,
      name: 'Question',
      controller: controller.quesController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter question';
        } else {
          return null;
        }
      },
      suffixIcon: const Icon(
        Icons.abc,
        color: AppColors.transColor,
      ),
      obscureText: false,
      prefixIcon: const Icon(Icons.question_mark),
    );
  }

  TextArea answerTextArea() {
    var controller = Provider.of<UserProviderTest2>(context, listen: false);
    return TextArea(
      keyboardType: TextInputType.text,
      name: 'Answer',
      controller: controller.ansController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter answer';
        } else {
          return null;
        }
      },
      suffixIcon: const Icon(
        Icons.abc,
        color: AppColors.transColor,
      ),
      obscureText: false,
      prefixIcon: const Icon(Icons.question_answer),
    );
  }
}
