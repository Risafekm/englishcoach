// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:englishcoach/application/provider/userprovider_test1.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/drawer/priliminary_tests1/update_page/edit_test1_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopTest1Home extends StatefulWidget {
  const DesktopTest1Home({super.key});

  @override
  State<DesktopTest1Home> createState() => _DesktopTest1HomeState();
}

class _DesktopTest1HomeState extends State<DesktopTest1Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserproviderTest>(context, listen: false).getData();
    });
    super.initState();
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserproviderTest>(context);
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
                'Preliminary Test 1',
                style: AppStyles.appBarTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0)),
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
                                            ontap: () async {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                await Provider.of<
                                                            UserproviderTest>(
                                                        context,
                                                        listen: false)
                                                    .addData();
                                                // Provider.of<UserproviderTest>(
                                                //         context,
                                                //         listen: false)
                                                //     .getData();
                                                Navigator.pop(context);
                                              }

                                              snackbar(context, text: 'added');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            });
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
      body: Consumer<UserproviderTest>(builder: (context, value, child) {
        if (value.isLoding) {
          return const Center(child: CircularProgressIndicator());
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
                          backgroundColor: AppColors.accentColor1,
                          child: Text(
                            posts[index].topic_que_num.toString(),
                            style: const TextStyle(
                                color: AppColors.secondaryColor),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Question : ${posts[index].topic_que_question}',
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.bodyText,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Answer : ${posts[index].topic_ans_answer}',
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.bodyText,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            controller.updatequestionController.text =
                                user.topic_que_question;
                            controller.updateanswersController.text =
                                user.topic_ans_answer;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    EditPageTest1(user: user)));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.accentColor1,
                          ),
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Delete Question ${posts[index].topic_que_num}',
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
                                              user.topic_que_num.toString(),
                                              context);

                                          print('deleted successfull ui');
                                          Navigator.pop(context);
                                          snackbar(context, text: 'deleted');
                                        },
                                        child: Text(
                                          'Yes',
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
                ));
          },
        );
      }),
    );
  }

  TextArea questionTextArea() {
    var controller = Provider.of<UserproviderTest>(context, listen: false);
    return TextArea(
      keyboardType: TextInputType.text,
      name: 'Question',
      controller: controller.questionController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter question';
        } else {
          return null;
        }
      },
      suffixIcon: const Icon(Icons.abc, color: AppColors.transColor),
      obscureText: false,
      prefixIcon: const Icon(Icons.question_mark),
    );
  }

  TextArea answerTextArea() {
    var controller = Provider.of<UserproviderTest>(context, listen: false);
    return TextArea(
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
      suffixIcon: const Icon(Icons.abc, color: AppColors.transColor),
      obscureText: false,
      prefixIcon: const Icon(Icons.question_answer),
    );
  }

//snackbar

  snackbar(BuildContext context, {required String text}) {
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
