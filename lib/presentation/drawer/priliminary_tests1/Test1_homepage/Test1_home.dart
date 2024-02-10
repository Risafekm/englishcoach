import 'package:englishcoach/domain/Model/quizTest1model.dart';
import 'package:englishcoach/presentation/drawer/priliminary_test1/insertpage/insert_test1_page.dart';
import 'package:englishcoach/Application/Provider/userprovider_test1.dart';
import 'package:englishcoach/presentation/drawer/priliminary_test1/updatepage/edit_test1_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<userprovidertest1>(context, listen: false).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<userprovidertest1>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(
          'Test 1 Questions & Answers',
          style: GoogleFonts.lora(fontWeight: FontWeight.w600),
        ),
        elevation: 3,
      ),
      body: Consumer<userprovidertest1>(builder: (context, value, child) {
        if (value.isLoding) {
          return const CircularProgressIndicator();
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
                          child: Text(posts[index].topic_que_num.toString()),
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
                                style: GoogleFonts.lora(
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Answer : ${posts[index].topic_ans_answer}',
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
                                user.topic_que_question;
                            controller.updateanswersController.text =
                                user.topic_ans_answer;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditPage(user: user)));

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
                            controller.deleteData(user.topic_que_num, context);
                            print('Delete button tapped');
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
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const InsertModalSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<dynamic> deleteAlertBox(BuildContext context, List<QuizTest1> posts,
      int index, userprovidertest1 controller, QuizTest1 user) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Delete Question ${posts[index].topic_que_num}',
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
                  controller.deleteData(user.topic_que_num, context);
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
}
