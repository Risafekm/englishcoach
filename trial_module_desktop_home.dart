import 'package:englishcoach/domain/Model/trial_modules_model.dart';
import 'package:englishcoach/domain/const/const_colors.dart';
import 'package:englishcoach/domain/const/const_styles.dart';
import 'package:englishcoach/presentation/drawer/trial_module/description_page/trial_module_description.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:englishcoach/Application/Provider/user_provider_trial_modules.dart';

import '../preliminary_test2/test2_home/widgets/buttonsmall.dart';
import '../preliminary_test2/test2_home/widgets/textarea.dart';
import 'edit_trial/edit_trial_module.dart';

class DesktopTrialModule extends StatefulWidget {
  const DesktopTrialModule({super.key});

  @override
  State<DesktopTrialModule> createState() => _DesktopTrialModuleState();
}

class _DesktopTrialModuleState extends State<DesktopTrialModule> {
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProviderTrialModules>(context, listen: false).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor1,
        centerTitle: true,
        title: Text(
          'Trial Modules',
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
            child: GestureDetector(
              onTap: () {
                modelSheet(context);
              },
              child: const CircleAvatar(
                child: Icon(
                  Icons.add,
                  color: AppColors.actionColor1,
                  size: 22,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height*.6,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            //  const SizedBox(height: 40),
            Expanded(
              child: cards(),
            ),
          ],
        ),
      ),
    );
  }

  Consumer<UserProviderTrialModules> cards() {
    var controller = Provider.of<UserProviderTrialModules>(context);
    return Consumer<UserProviderTrialModules>(
        builder: ((context, value, child) {
      if (value.isLoding) {
        return const Center(child: CircularProgressIndicator());
      }
      final posts = value.posts;

      return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          var user = posts[index];
          return Container(
            height: 250,
            decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TrialDescription(data: posts[index],)));
              },
              child: Card(
                color: AppColors.accentColor2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 40,
                      child: Text(posts[index].modNum),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(posts[index].modName)],
                      ),
                    ),
                     const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            controller.modNameUpdateController.text =
                                posts[index].modName;
                            controller.modOrderUpdateController.text =
                                posts[index].modOrder;
                            controller.modDescriptionUpdateController.text =
                                posts[index].modDescription.toString();
                            controller.modContentUpdateController.text =
                                posts[index].modContent.toString();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    EditTrailPage(user: posts[index])));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.accentColor1,
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
    }));
  }

   Future<dynamic> deleteAlertBox(BuildContext context, List<TrialModule> posts,
      int index, UserProviderTrialModules controller, TrialModule user) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Delete Card ${posts[index].modNum}',
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
    var controller =
        Provider.of<UserProviderTrialModules>(context, listen: false);

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
                          'Add new Modules',
                          style: AppStyles.bodyText,
                        ),
                        const SizedBox(height: 50),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'mod order',
                          controller: controller.modOrderController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(Icons.abc,
                              color: AppColors.transColor),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.flash_auto_outlined),
                        ),
                        const SizedBox(height: 20),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'module Name',
                          controller: controller.modNameController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(Icons.abc,
                              color: AppColors.transColor),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.title),
                        ),
                        const SizedBox(height: 20),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'Content',
                          controller: controller.modContentController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(Icons.abc,
                              color: AppColors.transColor),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.comment),
                        ),
                        const SizedBox(height: 20),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'Description',
                          controller: controller.modDescriptionController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(Icons.abc,
                              color: AppColors.transColor),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.comment),
                        ),
                        const SizedBox(height: 20),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'Special note',
                          controller: controller.modSpecialNoteController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(Icons.abc,
                              color: AppColors.transColor),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.comment),
                        ),
                        const SizedBox(height: 20),
                        TextArea(
                          keyboardType: TextInputType.text,
                          name: 'tnum',
                          controller: controller.tNumController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: const Icon(Icons.abc,
                              color: AppColors.transColor),
                          obscureText: false,
                          prefixIcon: const Icon(Icons.comment),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: 'POST',
                          ontap: () {
                            if (formkey.currentState!.validate()) {
                              Provider.of<UserProviderTrialModules>(context,
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
