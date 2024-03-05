import 'package:englishcoach/application/provider/userprovider_exercises.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/domain/model/exercisesmodel.dart';
import 'package:englishcoach/presentation/drawer/modules_exercises_page/editpage/edit_exercises.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProviderExercises>(context, listen: false).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserProviderExercises>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        centerTitle: true,
        elevation: 3,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.secondaryColor,
          ),
        ),
        title: Text(
          'Exercises',
          style: AppStyles.appBarTitle,
        ),
      ),
      body: Consumer<UserProviderExercises>(builder: (context, value, child) {
        if (value.isLoding) {
          return const Center(
            child: CircularProgressIndicator(),
          );
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
                        child: Text(user.exeNum.toString()),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Question :${user.exeQuestion}'.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.bodyText,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Answer :${user.exeAnswer}',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.bodyText,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          controller.editExeNumController.text =
                              posts[index].exeNum;
                          controller.editModnumController.text =
                              posts[index].modNum;
                          controller.editQuesController.text =
                              posts[index].exeQuestion.toString();
                          controller.editAnsController.text =
                              posts[index].exeAnswer.toString();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  EditExercises(user: posts[index])));
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        onPressed: () {
          modelSheet(context);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.actionColor1,
        ),
      ),
    );
  }

  Future<dynamic> deleteAlertBox(BuildContext context, List<Exercises> posts,
      int index, UserProviderExercises controller, Exercises user) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Delete Question ${posts[index].exeNum}',
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
                  controller.deleteData(user.exeNum.toString(), context);
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

  Future<dynamic> modelSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
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
                    modnumTextArea(),
                    const SizedBox(height: 20),
                    questionTextArea(),
                    const SizedBox(height: 20),
                    answerTextArea(),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'POST',
                      ontap: () {
                        if (formkey.currentState!.validate()) {
                          Provider.of<UserProviderExercises>(context,
                                  listen: false)
                              .addData(context);

                          Navigator.pop(context);
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        });
  }

  TextArea modnumTextArea() {
    var controller = Provider.of<UserProviderExercises>(context, listen: false);
    return TextArea(
      keyboardType: TextInputType.text,
      name: 'Modnum',
      controller: controller.modnumController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter modnum';
        } else {
          return null;
        }
      },
      suffixIcon: const Icon(
        Icons.abc,
        color: AppColors.transColor
      ),
      obscureText: false,
      prefixIcon: const Icon(Icons.comment),
    );
  }

  TextArea questionTextArea() {
    var controller = Provider.of<UserProviderExercises>(context, listen: false);
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
    var controller = Provider.of<UserProviderExercises>(context, listen: false);
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
