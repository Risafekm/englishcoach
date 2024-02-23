// ignore_for_file: avoid_print
import 'package:englishcoach/application/provider/user_provider_topic_test.dart';
import 'package:englishcoach/domain/model/topictestmodel.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/drawer/topic_tests/update_topic_test/update_topic_tests.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicTests extends StatefulWidget {
  const TopicTests({super.key});

  @override
  State<TopicTests> createState() => _TopicTestsState();
}

class _TopicTestsState extends State<TopicTests> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserproviderTopicTest>(context, listen: false).getData();
    });
    super.initState();
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserproviderTopicTest>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Topic Tests',
          style: GoogleFonts.lora(fontWeight: FontWeight.w600),
        ),
        elevation: 3,
      ),
      body: Consumer<UserproviderTopicTest>(builder: (context, value, child) {
        if (value.isLoding) {
          return const Center(child: CircularProgressIndicator());
        }
        final posts = value.posts;
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            var user = posts[index];
            return Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                ),
                child: Card(
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        CircleAvatar(
                          child: Text(posts[index].topicQueNum.toString()),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Question : ${posts[index].topicQueQuestion}',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lora(
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Answer : ${posts[index].topicAnsAnswer}',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lora(
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            controller.updatequestionController.text =
                                user.topicQueQuestion;
                            controller.updateanswersController.text =
                                user.topicAnsAnswer;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    UpdateTopicTest(user: user)));

                            print('Edit button tapped');
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteAlertBox(
                                context, posts, index, controller, user);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade200,
        onPressed: () {
          modelSheet(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<dynamic> deleteAlertBox(BuildContext context, List<TopicTest> posts,
      int index, UserproviderTopicTest controller, TopicTest user) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Delete Question ${posts[index].topicQueNum}',
              style:
                  GoogleFonts.lora(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            content: Text(
              'Are you sure?',
              style:
                  GoogleFonts.lora(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  controller.deleteData(user.topicQueNum, context);
                  Navigator.pop(context);
                },
                child: const Text(
                  'yes',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
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
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: const BorderRadius.only(
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
                        style: GoogleFonts.lora(
                            fontSize: 22,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 50),
                      questionTextArea(),
                      const SizedBox(height: 20),
                      answerTextArea(),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Post',
                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            Provider.of<UserproviderTopicTest>(context,
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
    var controller = Provider.of<UserproviderTopicTest>(context, listen: false);
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
      suffixIcon: const Icon(
        Icons.abc,
        color: Colors.transparent,
      ),
      obscureText: false,
      prefixIcon: const Icon(Icons.question_mark),
    );
  }

  TextArea answerTextArea() {
    var controller = Provider.of<UserproviderTopicTest>(context, listen: false);
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
      suffixIcon: const Icon(
        Icons.abc,
        color: Colors.transparent,
      ),
      obscureText: false,
      prefixIcon: const Icon(Icons.question_answer),
    );
  }
}
