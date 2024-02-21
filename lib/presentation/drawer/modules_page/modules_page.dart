// ignore_for_file: unused_local_variable

import 'package:englishcoach/application/provider/userprovider_modules.dart';
import 'package:englishcoach/domain/model/modulesmodel.dart';
import 'package:englishcoach/presentation/drawer/modules_page/edit_page/edit_modules.dart';
import 'package:englishcoach/presentation/drawer/modules_page/description_page/modules_description.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModulesPage extends StatefulWidget {
  const ModulesPage({super.key});

  @override
  State<ModulesPage> createState() => _ModulesPageState();
}

class _ModulesPageState extends State<ModulesPage> {
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserproviderModules>(context, listen: false).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserproviderModules>(context);
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black38,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          title: Text(
            'Modules',
            style: GoogleFonts.lora(
                fontWeight: FontWeight.w600, color: Colors.white),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                modelSheet(context);
              },
              child: const CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 22,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: cards(),
              ),
              Container(
                height: 240,
                width: MediaQuery.of(context).size.width * .98,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: 180,
                child: cards(),
              ),
              Container(
                height: 240,
                width: MediaQuery.of(context).size.width * .98,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ));
  }

  Consumer<UserproviderModules> cards() {
    var controller = Provider.of<UserproviderModules>(context);

    return Consumer<UserproviderModules>(builder: ((context, value, child) {
      if (value.isLoding) {
        return const Center(child: CircularProgressIndicator());
      }
      final posts = value.posts;

      return ReorderableListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: posts.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }

            // Perform the reordering directly on the posts list
            controller.posts
                .insert(newIndex, controller.posts.removeAt(oldIndex));
          });

          // namma new set aakkiya function vilikkanam
          setState(() {});
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            key: ValueKey(posts[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionPage(data: posts[index]),
                ),
              );
            },
            onLongPress: () {
              deleteAlertBox(context, posts, index, controller, posts[index]);
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 8.0, bottom: 8.0),
                  child: Container(
                    height: 160,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.green.shade600,
                          Colors.blue.shade300,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        posts[index].modName,
                        style:
                            GoogleFonts.lora(fontSize: 18, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -5,
                  bottom: -12,
                  child: Text(
                    posts[index].modOrder,
                    style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade400),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      controller.editmodnameController.text =
                          posts[index].modName;
                      controller.editmoddescriptionController.text =
                          posts[index].modDescription;
                      controller.editmodcontentController.text =
                          posts[index].modContent;
                      controller.editmodorderController.text =
                          posts[index].modOrder;
                      controller.editmodspecialnoteController.text =
                          posts[index].modSpecialnote;
                      controller.edittnumController.text = posts[index].tNum;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditModules(user: posts[index])));
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Icon(
                        Icons.edit,
                        size: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }));
  }

  Future<dynamic> deleteAlertBox(BuildContext context, List<Modules> posts,
      int index, UserproviderModules controller, Modules user) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Delete Question ${posts[index].modOrder}',
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
                  controller.deleteData(user.modNum.toString(), context);
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

  // Future<dynamic> deleteMethod(BuildContext context, List<Modules> posts,
  //     int index, UserproviderModules controller, Modules user) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text(
  //             'Delete Module ${posts[index].modNum}',
  //             style:
  //                 GoogleFonts.lora(fontWeight: FontWeight.w700, fontSize: 18),
  //           ),
  //           content: Text(
  //             'Are you sure?',
  //             style:
  //                 GoogleFonts.lora(fontWeight: FontWeight.w500, fontSize: 16),
  //           ),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: const Text(
  //                 'Cancel',
  //                 style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
  //               ),
  //             ),
  //             const SizedBox(width: 10),
  //             TextButton(
  //               onPressed: () {
  //                 controller.deleteData(user.modNum.toString(), context);
  //                 Navigator.pop(context);
  //               },
  //               child: const Text(
  //                 'yes',
  //                 style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }

  Future<dynamic> modelSheet(BuildContext context) {
    var controller = Provider.of<UserproviderModules>(context, listen: false);

    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        ),
        builder: (BuildContext context) {
          return Container(
              height: 550.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: const BorderRadius.only(
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
                          style: GoogleFonts.lora(
                              fontSize: 22,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 50),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'mod order',
                          controller: controller.modorderController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.flash_auto_outlined),
                        ),
                        const SizedBox(height: 20),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'heading',
                          controller: controller.modnameController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.title),
                        ),
                        const SizedBox(height: 20),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'Content',
                          controller: controller.modcontentController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.comment),
                        ),
                        const SizedBox(height: 20),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'Description',
                          controller: controller.moddescriptionController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.comment),
                        ),
                        const SizedBox(height: 20),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'Special note',
                          controller: controller.modspecialnoteController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.comment),
                        ),
                        const SizedBox(height: 20),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'tnum',
                          controller: controller.tnumController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.comment),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: 'Post',
                          ontap: () {
                            if (formkey.currentState!.validate()) {
                              Provider.of<UserproviderModules>(context,
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
              ));
        });
  }
}
