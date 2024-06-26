// ignore_for_file: unused_local_variable

import 'package:englishcoach/application/provider/userprovider_modules.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/domain/model/modulesmodel.dart';
import 'package:englishcoach/presentation/drawer/modules_page/edit_page/edit_modules.dart';
import 'package:englishcoach/presentation/drawer/modules_page/description_page/modules_description.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.accentColor1,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.secondaryColor,
            ),
          ),
          title: Text(
            'Modules',
            style: AppStyles.appBarTitle,
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
                  color: AppColors.accentColor1,
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
          if (oldIndex < newIndex) {
            // Reordering forwards
            newIndex -= 1;
          }
          final item = posts.removeAt(oldIndex);
          posts.insert(newIndex, item);
          // Notify the provider about the updated order
          controller.reorderModules(posts);
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
                      color: AppColors.accentColor2,
                    ),
                    child: Center(
                      child: Text(
                        posts[index].modName,
                        style: AppStyles.bodyText,
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
                    style: AppStyles.numStyle,
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
                        color: AppColors.accentColor1,
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
                  controller.deleteData(user.modNum.toString(), context);
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
  }

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
                            color: AppColors.transColor,
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
                            color: AppColors.transColor,
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
                            color: AppColors.transColor,
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
                            color: AppColors.transColor,
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
                              Provider.of<UserproviderModules>(context,
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
