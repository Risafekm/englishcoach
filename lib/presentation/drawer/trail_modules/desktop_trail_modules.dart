// ignore_for_file: unused_local_variable, avoid_print

import 'package:englishcoach/application/provider/user_provider_trail_modules.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/buttonsmall.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test2/test2_home/widgets/textarea.dart';
import 'package:englishcoach/presentation/drawer/trail_modules/description/trail_modules_description.dart';
import 'package:englishcoach/presentation/drawer/trail_modules/edit%20page/edi_trail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopTrailModules extends StatefulWidget {
  const DesktopTrailModules({super.key});

  @override
  State<DesktopTrailModules> createState() => _DesktopTrailModulesState();
}

class _DesktopTrailModulesState extends State<DesktopTrailModules> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProviderTrail>(context, listen: false).getData();
    });
    super.initState();
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserProviderTrail>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Trail Modules',
          style: AppStyles.appBarTitle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                modelSheet(context);
              },
              child: const CircleAvatar(
                // radius: 15,
                child: Icon(
                  Icons.add,
                  color: AppColors.accentColor1,
                  size: 22,
                ),
              ),
            ),
          )
        ],
      ),
      body: Consumer<UserProviderTrail>(builder: (context, value, child) {
        if (value.isLoding) {
          return const CircularProgressIndicator();
        }
        final posts = value.posts;
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            var user = posts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TrailDescriptionPage(data: posts[index])));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                ),
                child: Card(
                  child: Container(
                    height: 120,
                    margin: const EdgeInsets.only(right: 10, left: 10, top: 5),
                    width: MediaQuery.of(context).size.width * 6,
                    decoration: BoxDecoration(
                      color: AppColors.accentColor2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: AppColors.accentColor1,
                          child: Text(
                            posts[index].modOrder.toString(),
                            style: const TextStyle(
                                color: AppColors.secondaryColor),
                          ),
                        ),
                        const SizedBox(width: 70),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name : ${posts[index].modName}',
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.trailmodulehead,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Special Note : ${posts[index].modContent}',
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.bodyTextTrail,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    EditTrailPage(user: user)));
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
                                      'Delete Module ${posts[index].modOrder}',
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
                                              user.modNum.toString(), context);
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
              ),
            );
          },
        );
      }),
    );
  }

//floating action button function
  Future<dynamic> modelSheet(BuildContext context) {
    var controller = Provider.of<UserProviderTrail>(context, listen: false);

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
                        CustomButton(
                          text: 'POST',
                          ontap: () {
                            if (formkey.currentState!.validate()) {
                              Provider.of<UserProviderTrail>(context,
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
